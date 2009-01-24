package Cicindela::Config::_common;
use strict;
use vars qw(%C);
*Config = \%C;

$C{CICINDELA_HOME} = '/home/cicindela';
$C{LOG_CONF} = $C{CICINDELA_HOME}. '/etc/log.conf';
$C{FILTERS_NAMESPACE} = 'Cicindela::Filters';

$C{DEFAULT_DATASOURCE} = [ 'dbi:mysql:cicindela_bookmark;host=localhost', 'root', 'pass' ];

$C{SETTINGS} = {
    'bookmark' => {
        datasource =>  [ 'dbi:mysql:cicindela_bookmark;host=localhost', 'root', 'pass' ],
        filters => [
            'PicksExtractor',
            'InverseUserFrequency',
            'ItemSimilarities',
        ],
        recommender => 'ItemSimilarities',
        refresh_interval => 1,
    }
};

# for using cleanup_mysql_binlog.pl
$C{DB_MAINTENANCE_SETS} = [
    {
        master => [ 'dbi:mysql:host=localhost', 'maintenance', '' ],
        slave => [],
    },
];

1;
