package Koha::Plugin::Com::ByWaterSolutions::ByWater_Help_Links;

use Modern::Perl;

use base qw(Koha::Plugins::Base);
use JSON;

our $VERSION = "1.0.3";

our $metadata = {
    name             => 'ByWater_Help_Links',
    author           => 'Andrew Fuerste-Henry',
    description      => 'This plugin adds links to the ByWater Solutions help center throughout Koha\'s staff interface.',
    date_authored    => '2026-04-06',
    date_updated     => '2026-04-09',
    minimum_version  => '22.11',
    maximum_version  => '26.05',
    version          => $VERSION,
};

sub new {
    my ( $class, $args ) = @_;

    $args->{'metadata'} = $metadata;
    my $self = $class->SUPER::new($args);

    return $self;
}

sub install {
    my ( $self, $args ) = @_;

    return 1;
}

sub upgrade {
    my ( $self, $args ) = @_;

    return 1;
}

sub uninstall {
    my ( $self, $args ) = @_;

    return 1;
}

sub static_routes {
    my ( $self, $args ) = @_;

    my $spec_str = $self->mbf_read('staticapi.json');
    my $spec     = decode_json($spec_str);

    return $spec;
}

sub api_namespace {
    my ($self) = @_;
    return 'bywatersolutions_bywaterhelplinks';
}

sub intranet_head {
    my ( $self ) = @_;

    return q|
   <script src="/api/v1/contrib/bywatersolutions_bywaterhelplinks/static/js/bywaterhelplinks.js" type="module"></script>
   <link rel="stylesheet" href="/api/v1/contrib/bywatersolutions_bywaterhelplinks/static/css/bywaterhelplinks.css">
|;
}
