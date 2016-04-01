package Bencher::ScenarioUtil::DataCSel;

# DATE
# VERSION

our @datasets = (
    {name => 'small1-hash'  , summary => '16 elements, 4 levels (hash-based nodes)'  , args=>{tree=>'small1-hash'}},
    {name => 'small1-array' , summary => '16 elements, 4 levels (array-based nodes)' , args=>{tree=>'small1-array'}},
    {name => 'medium1-hash' , summary => '20k elements, 7 levels (hash-based nodes)' , args=>{tree=>'medium1-hash'}},
    {name => 'medium1-array', summary => '20k elements, 7 levels (array-based nodes)', args=>{tree=>'medium1-array'}},
);

# we want to record the version of these modules too in the benchmark result
# metadata
our @extra_modules = (
    'PERLANCAR::Tree::Examples',
);

1;
# ABSTRACT: Utility routines
