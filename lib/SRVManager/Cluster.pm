package SRVManager::Cluster;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
	my $self = shift;

	$self->render(
		'cluster/index',
		message => 'This is the cluster page!');
}

sub id {
	my $self = shift;
	my $id = $self->stash('q');
	my $result = $self->db->resultset('Cluster')->find({ cluster_id => $id });
	$result ? $self->stash(message => "Show cluster by cluster id. You requested id: $id") :
		  $self->stash(message => "No result found for ID '$id'!");
	$self->render(
		'cluster/result',
		result => $result,
	);
}

sub name {
	my $self = shift;
	my $name = $self->stash('q');
	my $result = $self->db->resultset('Cluster')->find({ name => $name });
	$result ? $self->stash(message => "Show cluster by name. You requested name: $name") :
		  $self->stash(message => "No result found for '$name'!");

	$self->render(
		'cluster/result',
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
	
	my $result = $self->db->resultset('Cluster')->search(
		\["(
			NAME		LIKE \"%$q%\" OR
			DESCRIPTION	LIKE \"%$q%\"
		)" . $disposed||""]
	);
	$result->count ? $self->stash(message => "Query cluster. You queried for '$q'") :
		  $self->stash(message => "No result found for '$q'!");
	$self->render(
		'cluster/result_multi',
		result => $result,
	);
}

sub edit {
	my $self = shift;
	my $id = $self->stash('q');
	my $result = $self->db->resultset('Server')->find({ server_id => $id });
	$result ? $self->stash(message => "Edit server by server id. You requested id: $id") :
		  $self->stash(message => "No result found for ID '$id'!");
	$self->render(
		'cluster/edit',
		result => $result,
	);
}

1;
