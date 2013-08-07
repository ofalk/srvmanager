package SRVManager::Server;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
	my $self = shift;

	$self->render(
		'server/index',
		message => 'This is the server page!');
}

sub id {
	my $self = shift;
	my $id = $self->stash('q');
	my $result = $self->db->resultset('Server')->find({ server_id => $id });
	$result ? $self->stash(message => "Show server by server id. You requested id: $id") :
		  $self->stash(message => "No result found for ID '$id'!");
	$self->render(
		'server/result',
		result => $result,
	);
}

sub name {
	my $self = shift;
	my $name = $self->stash('q');
	my $result = $self->db->resultset('Server')->find({ hostname => $name });
	$result ? $self->stash(message => "Show server by name. You requested name: $name") :
		  $self->stash(message => "No result found for '$name'!");

	$self->render(
		'server/result',
		result => $result,
	);
}

sub query {
	my $self = shift;
	my $q = $self->param('q');
	my $disposed = "";
	$disposed = "AND CAT_STATUS_ID NOT IN (SELECT STATUS_ID FROM CAT_STATUS WHERE NAME = 'Disposed')" unless $self->param('disposed');
	$self->stash(q => $q);
	$self->stash(disposed => $self->param('disposed'));
	
	my $result = $self->db->resultset('Server')->search(
		\["(
			HOSTNAME	LIKE \"%$q%\" OR
			IP_ADDRESS	LIKE \"%$q%\" OR
			DESCRIPTION	LIKE \"%$q%\" OR
			APPLICATION	LIKE \"%$q%\" OR
			SERIAL_NR	LIKE \"%$q%\"
		)" . $disposed||""]
	);
	$result->count ? $self->stash(message => "Query server. You queried for '$q'") :
		  $self->stash(message => "No result found for '$q'!");
	$self->render(
		'server/result_multi',
		result => $result,
	);
}

1;
