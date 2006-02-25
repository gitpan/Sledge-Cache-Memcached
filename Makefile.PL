use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'Sledge::Cache::Memcached',
    'VERSION_FROM' => 'lib/Sledge/Cache/Memcached.pm', # finds $VERSION
    'PREREQ_PM'    => {
        Test::More       => 0.32,
        Cache::Memcached => 1.15,
    },
);
