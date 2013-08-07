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
	my $disposed = "AND STATUS_ID NOT IN (SELECT STATUS_ID FROM CAT_STATUS WHERE NAME = 'Disposed')" if $self->param('disposed');
	warn $q;
	my $result = $self->db->resultset('Server')->search({ hostname => { -like => "$q%" } });
	my $message = "Qery server. You requested '$q'";
	$message = "No result found for '$q'!" unless $result;
	$self->render(
		'server/result_multi',
		result => $result,
	);
}

1;
