#!perl

use strict;
use warnings;

use Test::More;
use Test::Fatal;

use mop;

role Service {
    has $!is_locked = 0;
}

role WithClass        with Service {}
role WithParameters   with Service {}
role WithDependencies with Service {}

{
    local $@;
    eval q[class ConstructorInjection with WithClass, WithParameters, WithDependencies {}];
    ok(!$@, '... this worked');
}

done_testing;
