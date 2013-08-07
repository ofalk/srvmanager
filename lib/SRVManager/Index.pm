package SRVManager::Index;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {
  my $self = shift;

  $self->render(
    message => 'Welcome to the SRVManager!');
}

1;
