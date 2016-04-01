package Bencher::Scenario::DataCSel::Selection;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Bencher::ScenarioUtil::DataCSel;
use PERLANCAR::Tree::Examples qw(gen_sample_tree);

my @exprs = (
    'Sub4',
    'Sub4:first-child',
);

my @datasets = do {
    my @res = @Bencher::ScenarioUtil::DataCSel::datasets;
    for (@res) {
        $_->{args}{'expr@'} = \@exprs;
    }
    @res;
};

our $scenario = {
    summary => 'Benchmark selector',
    description => <<'_',

Sample documents from `PERLANCAR::HTML::Tree::Examples` are used.

_
    before_gen_items => sub {
        # prepare trees
        %main::trees = ();
        for (@Bencher::ScenarioUtil::DataCSel::datasets) {
            $_->{name} =~ /(.+)-(.+)/ or die;
            $main::trees{$_->{name}} = gen_sample_tree(size=>$1, backend=>$2);
        }
    },
    participants => [
        {
            module => 'Data::CSel',
            fcall_template => 'my @res = Data::CSel::csel({class_prefixes=>["Tree::Example::HashNode", "Tree::Example::ArrayNode"]}, <expr>, $main::trees{<tree>}); scalar @res',
        },
    ],
    datasets => \@datasets,
    extra_modules => \@Bencher::ScenarioUtil::DataCSel::extra_modules,
};

1;
# ABSTRACT:
