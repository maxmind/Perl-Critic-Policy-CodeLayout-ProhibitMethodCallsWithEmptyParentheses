# NAME

Perl::Critic::Policy::CodeLayout::ProhibitMethodCallsWithEmptyParentheses - Policy to find empty parentheses on method calls

# VERSION

version 1.000000

# DESCRIPTION

This policy detects if you make a method call with parentheses but with
no parameters.

For example these will cause a violation:

    $foo->bar();
    $foo->bar->baz();

Where these will not:

    $foo->bar;
    $foo->bar->baz;
    $foo->bar( $baz );
    $foo->bar( baz => $buzz );

# CONFIGURATION

There is no configuration for this policy.

# VERSIONING POLICY

This module uses semantic versioning as described by
[http://semver.org/](http://semver.org/). Version numbers can be read as X.YYYZZZ, where X is the
major number, YYY is the minor number, and ZZZ is the patch number..

# SUPPORT

Please report all issues with this code using the GitHub issue tracker at
[https://github.com/maxmind/Perl-Critic-Policy-CodeLayout-ProhibitMethodCallsWithEmptyParentheses/issues](https://github.com/maxmind/Perl-Critic-Policy-CodeLayout-ProhibitMethodCallsWithEmptyParentheses/issues).

# AUTHOR

Mark Fowler <mfowler@maxmind.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by MaxMind, Inc..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
