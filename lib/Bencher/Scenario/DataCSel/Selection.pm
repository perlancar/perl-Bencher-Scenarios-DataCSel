package Bencher::Scenario::DataCSel::Selection;

# DATE
# VERSION

use Bencher::ScenarioUtil::DataCSel qw($tree);

# for easy reference inside code
$main::tree = $tree;

our $scenario = {
    summary => 'Benchmark parsing speed',
    participants => [
        { module => 'Data::CSel', code_template => 'my @res = Data::CSel::csel(<expr>, $main::tree); scalar @res' },
    ],
    datasets => [
        {args => {expr=>'*'}},
        {args => {expr=>'[id > 20000]'}},
        {args => {expr=>':has([level = 1])'}},
        {args => {expr=>':not([level > 1])'}},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION

Notes:

=over

=item *

For simple expression (like C<*> or C<T> or just C<[id > 123]>) and a document
tree of thousands of objects (in this benchmark, we use a tree of height 7 and
~20k nodes), the bottleneck is collecting descendant nodes. We must perform at
least 20k calls to _children_as_list(), parent(), child(), _descendants(). And
pushing the results to the final list.

=back
