package Bencher::Scenario::DataCSel::Startup;

# DATE
# VERSION

#use FindBin '$Bin';
# XXX replace $^X with perl path provided by bencher

our $scenario = {
    summary => 'Benchmark startup overhead of loading Data::CSel and parsing expressions',
    participants => [
        { name => 'perl',              cmdline => [$^X, "-I$Bin/..lib", "-e1"] },
        { name => 'load_csel_parser',  cmdline => [$^X, "-I$Bin/..lib", "-MData::CSel::Parser", "-e", 1] },
    ],
};

1;
# ABSTRACT:
