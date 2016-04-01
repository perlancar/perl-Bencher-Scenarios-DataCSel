package Bencher::Scenario::DataCSel::Parsing;

# DATE
# VERSION

our $scenario = {
    summary => 'Benchmark parsing speed',
    modules => {
        'Data::CSel' => {version => '0.04'},
    },
    participants => [
        { fcall_template => 'Data::CSel::parse_csel(<expr>)' },
    ],
    datasets => [
        {args=>{expr=>'*'}},
        {args=>{expr=>'T'}},
        {args=>{expr=>'T T2 T3 T4 T5'}},
        {args=>{expr=>'T ~ T ~ T ~ T ~ T'}},
        {args=>{expr=>':has(T[length > 1])'}},
    ],
};

1;
# ABSTRACT:
