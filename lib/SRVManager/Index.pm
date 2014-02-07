package SRVManager::Index;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub home {
  my $self = shift;

  $self->render(
    message => 'Welcome to SM!');
}

1;
