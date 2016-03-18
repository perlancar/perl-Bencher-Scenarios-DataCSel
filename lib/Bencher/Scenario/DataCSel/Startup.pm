package Bencher::Scenario::DataCSel::Startup;

# DATE
# VERSION

our $scenario = {
    summary => 'Benchmark startup overhead of loading Data::CSel and parsing expressions',
    participants => [
        { name => 'perl',            perl_cmdline => ["-e1"] },
        { name => 'load_csel',       perl_cmdline => ["-MData::CSel", "-e1"] },
        { name => 'load_csel_parse', perl_cmdline => ["-MData::CSel=parse_csel", "-e", "parse_csel(q(E F))"] },
    ],
};

1;
# ABSTRACT:
