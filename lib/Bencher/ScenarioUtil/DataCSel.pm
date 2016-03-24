package Bencher::ScenarioUtil::DataCSel;

# DATE
# VERSION

use strict;
use warnings;

use Data::Random::Tree qw(create_random_tree);
use Tree::Object;

use Exporter qw(import);
our @EXPORT_OK = qw($tree);
our %EXPORT_TAGS = (all => \@EXPORT_OK);

# this is a tree of height 7, ~20k objects. this is on par with my current
# todo.org (~750kB) which contains ~2900 todo items and ~20k Org::Element
# objects when parsed with Org::Parser.
our $tree = do {
    my $id = 0;
    create_random_tree(
        num_objects_per_level => [100, 3000, 5000, 8000, 3000, 1000, 300],
        classes => ['Tree::Object'],
        code_instantiate_node => sub {
            my ($class, $level, $parent) = @_;
            if ($level % 2) { $class = "Tree::Object::T1" } else { $class = "Tree::Object::T2" }
            $class->new(id => $id++, level => $level);
        },
    );
};

package # hide from PAUSE
    Tree::Object::T0;
use parent qw(Tree::Object);

sub id { $_[0]{id} }
sub level { $_[0]{level} }

package # hide from PAUSE
    Tree::Object::T1;
use base qw(Tree::Object::T0);

package # hide from PAUSE
    Tree::Object::T2;
use base qw(Tree::Object::T0);

package # hide from PAUSE
    Tree::Object::T3;
use base qw(Tree::Object::T0);

1;
# ABSTRACT: Utility routines
