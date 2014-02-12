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

#	$self->plugin('DBViewer',
#		dsn		=> $self->{config}->{database}->{dsn},
#		user		=> $self->{config}->{database}->{user},
#		password	=> $self->{config}->{database}->{password},
#	);

	$self->{schema} = Schema->connect(
		$self->{config}->{database}->{dsn},
		$self->{config}->{database}->{user},
		$self->{config}->{database}->{password},
	);
	$self->helper(db => sub { $self->{schema} });

	$self->helper(ref => sub { my $self = shift; ref(shift()) });
	$self->helper(Dumper => sub { my $self = shift; Dumper(shift()) });
	$self->helper(column_info => sub {
		my $self = shift;
		$self->{stash}->{result}->result_source->column_info(shift);
	});
	$self->helper(is_nullable => sub {
		my $self = shift;
		$self->{stash}->{result}->result_source->column_info(shift)->{is_nullable};
	});
	$self->helper(data_type => sub {
		my $self = shift;
		$self->{stash}->{result}->result_source->column_info(shift)->{data_type};
	});
	$self->helper(size => sub {
		my $self = shift;
		$self->{stash}->{result}->result_source->column_info(shift)->{size};
	});
	$self->helper(get_name => sub {
		# Language stuff / translations should come here.
		my $self = shift;
		my $sn = $self->{stash}->{result}->result_source->source_name;
		my $col = shift;
		# take care about the context/the class! We are in a request call here. Therefore we have to use ->{app}!! 
		$self->{app}->{config}->{column_names}->{$sn}->{$col} || $col;
	});
	$self->helper(datatype2inputtype => sub {
		my $self = shift;
		my $s = shift;
		if($s eq 'varchar') { return 'text' }
		elsif($s eq 'integer') { return 'number' }
		elsif($s eq 'date') { return 'datetime' }
		elsif($s eq 'text') { return 'textarea' }
		elsif($s eq 'tinyint') { return 'number' }
		else { return 'UNKNOWN' }
	});

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

	# Index
	$r->get('/')->to('index#home');

	# Server
	$r->get('/server')->to('server#index');
	$r->get('/server/:action/*q')->to('server#');

	$r->post('/server/query')->to('server#query');
	$r->get('/server/query')->to('server#query');

	# Cluster
	$r->get('/cluster')->to('cluster#index');
	$r->get('/cluster/:action/*q')->to('cluster#');

	$r->post('/cluster/query')->to('cluster#query');
	$r->get('/cluster/query')->to('cluster#query');

	# CatDomain
	$r->get('/catdomain')->to('CatDomain#index');
	$r->get('/catdomain/:action/*id')->to('CatDomain#');

	$r->post('/catdomain/query')->to('CatDomain#query');
	$r->get('/catdomain/query')->to('CatDomain#query');

	$r->post('/catdomain/save')->to('CatDomain#save');
}

1;
