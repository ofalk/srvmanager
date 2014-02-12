package SRVManager::CatDomain;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
	my $self = shift;

	use Data::Dumper;
	$self->render(
		'catdomain/index',
		message => 'This is the catdomain page!');
}

sub id {
	my $self = shift;
	my $id = $self->stash('q');
	my $result = $self->db->resultset('CatDomain')->find({ domain_id => $id });
	$result ? $self->stash(message => "Show domain by id. You requested id: $id") :
		  $self->stash(message => "No result found for ID '$id'!");
	$self->render(
		'catdomain/result',
		result => $result,
	);
}

sub name {
	my $self = shift;
	my $name = $self->stash('q');
	my $result = $self->db->resultset('CatDomain')->find({ name => $name });
	$result ? $self->stash(message => "Show domain by name. You requested name: $name") :
		  $self->stash(message => "No result found for '$name'!");

	$self->render(
		'catdomain/result',
		result => $result,
	);
}

sub query {
	my $self = shift;
	my $q = $self->param('q');
	$q = $self->session->{q} unless $q;
	$q = '' unless $q;
	$self->stash(q => $q);
	$self->session->{q} = $q;
	
	my $result = $self->db->resultset('CatDomain')->search(
		\["(
			NAME		LIKE \"%$q%\"
		)"]
	);
	$result->count ? $self->stash(message => "Query domain. You queried for '$q'") :
		  $self->stash(message => "No result found for '$q'!");
	$self->render(
		'catdomain/result_multi',
		result => $result,
	);
}

sub edit {
	my $self = shift;
	my $id = $self->stash('id');
	my $result = $self->db->resultset('CatDomain')->find({ domain_id => $id });
	$result ? $self->stash(message => "Edit domain by id. You requested id: $id") :
		  $self->stash(message => "No result found for ID '$id'!");
	$self->render(
		'catdomain/edit',
		result => $result,
	);
}

sub save {
	my $self = shift;
	use Data::Dumper;
	my $d = $self->db->resultset('CatDomain')->single({ domain_id => $self->req->params->to_hash->{domain_id} });
	$d->name($self->req->params->to_hash->{name});
	$d->update();
	
	$self->query();
}

1;
