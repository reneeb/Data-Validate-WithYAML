use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Data::Validate::WithYAML',
    license             => 'perl',
    dist_author         => 'Renee Baecker <module@renee-baecker.de>',
    dist_version_from   => 'lib/Data/Validate/WithYAML.pm',
    requires => {
        'YAML::Tiny'          => 1.03,
    },
    build_requires => {
        'Test::More'          => 0,
        'Test::CheckManifest' => 1.0,
    },
    add_to_cleanup      => [ 'Data::Validate::WithYAML-*' ],
);

$builder->create_build_script();
