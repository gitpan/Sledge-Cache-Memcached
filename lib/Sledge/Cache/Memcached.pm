package Sledge::Cache::Memcached;
use strict;
use warnings;
use base 'Sledge::Cache';
our $VERSION = '0.02';

use Cache::Memcached;

our $Expires = 24 * 60 * 60; # 24hour

sub _init {
    my ($self, $page) = @_;
    my $servers = $page->create_config->cache_servers;
    $self->{_memd} = Cache::Memcached->new({
        servers => $servers,
    });
}

sub _get {
    my ($self, $key) = @_;
    return $self->{_memd}->get($key);
}

sub _set {
    my ($self, $key, $val, $exptime) = @_;
    $exptime ||= $Expires;
    $self->{_memd}->set($key, $val, $exptime);
}

sub _remove {
    my ($self, $key) = @_;
    $self->{_memd}->delete($key);
}

1;
__END__

=head1 NAME

Sledge::Cache::Memcached - memcached plugin for sledge

=head1 SYNOPSIS

    package Your::Pages;
    use Sledge::Plugin::Cache;
    use Sledge::Cache::Memcached;
    sub create_cache { Sledge::Cache::Memcached->new(shift) }

=head1 DESCRIPTION

Sledge::Cache::Memcached is memcached subclass for Sledge::Cache.

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhiro at mobilefactory.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Sledge::Cache>, L<Sledge::Plugin::Cache>

=cut
