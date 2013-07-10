package SRVManager;
use Mojo::Base 'Mojolicious';
use YAML qw/LoadFile/;

# This method will run once at server start
sub startup {
	my $self = shift;

	$self->{config} = LoadFile('etc/srvmanager.yml');

	use Data::Dumper;
	warn Dumper($self->{config});

	$self->plugin('DBViewer',
		dsn		=> $self->{config}->{database}->{dsn},
		user		=> $self->{config}->{database}->{user},
		password	=> $self->{config}->{database}->{password},
	);
	# Only with Perl 5.14 and l8ter
	#$self->plugin('DBICAdmin' => {	});

	use Mojolicious::Plugin::TtRenderer::Engine;
 
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
	$r->get('/')->to('example#welcome');
}

1;
