package SRVManager;
use Mojo::Base 'Mojolicious';
use YAML qw/LoadFile/;
use Schema;

# This method will run once at server start
sub startup {
	my $self = shift;

	$self->{config} = LoadFile('etc/srvmanager.yml');
	
	$self->{secret} = 'ASDFIJL§$§)FDMNN"!=§$JFMN';

	use Data::Dumper;
	warn Dumper($self->{config});

	$self->plugin('DBViewer',
		dsn		=> $self->{config}->{database}->{dsn},
		user		=> $self->{config}->{database}->{user},
		password	=> $self->{config}->{database}->{password},
	);

	$self->{schema} = Schema->connect(
		$self->{config}->{database}->{dsn},
		$self->{config}->{database}->{user},
		$self->{config}->{database}->{password},
	);
	$self->helper(db => sub { $self->{schema} });

	$self->helper(ref => sub { my $self = shift; ref(shift()) });
	$self->helper(Dumper => sub { my $self = shift; Dumper(shift()) });

	# Only with Perl 5.14 and l8ter
	#$self->plugin('DBICAdmin' => {	});

	use Mojolicious::Plugin::TtRenderer::Engine;
	$self->plugin('Humane');
 
	my $tt = Mojolicious::Plugin::TtRenderer::Engine->build(
		mojo => $self,
		template_options => {
#			TRIM		=> 1,
#			PRE_CHOMP	=> 1,
#			POST_CHOMP	=> 1,
			PRE_PROCESS	=> $self->{config}->{template}->{header} || '',
			POST_PROCESS	=> $self->{config}->{template}->{footer} || '',
			UNICODE		=> 1,
			ENCODING	=> 'UTF-8',
			EVAL_PERL	=> 1, # Considered dangerous, but for development very useful
		},
	);

	$self->renderer->add_handler(tt => $tt);

	# Documentation browser under "/perldoc"
	$self->plugin('PODRenderer');

	# Router
	my $r = $self->routes;

	# Normal route to controller
	$r->get('/')->to('index#home');
	$r->get('/server')->to('server#index');
	$r->get('/server/:action/*q')->to('server#');
	$r->post('/server/query')->to('server#query');
}

1;
