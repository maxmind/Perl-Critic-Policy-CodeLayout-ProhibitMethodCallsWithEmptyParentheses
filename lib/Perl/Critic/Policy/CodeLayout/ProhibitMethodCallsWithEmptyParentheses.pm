package Perl::Critic::Policy::CodeLayout::ProhibitMethodCallsWithEmptyParentheses;
use 5.006001;
use strict;
use warnings;
use Readonly;

use Perl::Critic::Utils qw{
    :booleans :characters :severities :classification :data_conversion
};
use base 'Perl::Critic::Policy';

our $VERSION = '1.000000';

#-----------------------------------------------------------------------------

Readonly::Scalar my $EXPL => [283];

#-----------------------------------------------------------------------------

sub default_severity { return $SEVERITY_LOWEST; }
sub default_themes   { return qw() }

sub applies_to { return 'PPI::Token::Word' }

#-----------------------------------------------------------------------------

sub violates {
    my ( $self, $elem, undef ) = @_;

    # ignore if this isn't a method call
    return unless is_method_call($elem);

    # ignore if there's not a bracket next
    my $list = $elem->next_sibling;
    return unless $list;
    return unless $list->isa('PPI::Structure::List');
    return unless $list->braces eq '()';

    # ignore if this actually has arguments
    return if $list->children;

    # it's a violation
    return $self->violation(
        'Method ' . $elem->content . ' called with empty parentheses',
        'Remove the empty "()" from your method call',
        $elem,
    );
}

#-----------------------------------------------------------------------------

1;

# ABSTRACT: Policy to find empty parentheses on method calls

=head1 DESCRIPTION

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

=head1 CONFIGURATION
 
There is no configuration for this policy.

=head1 VERSIONING POLICY

This module uses semantic versioning as described by
L<http://semver.org/>. Version numbers can be read as X.YYYZZZ, where X is the
major number, YYY is the minor number, and ZZZ is the patch number..

=head1 SUPPORT

Please report all issues with this code using the GitHub issue tracker at
L<https://github.com/maxmind/Perl-Critic-Policy-CodeLayout-ProhibitMethodCallsWithEmptyParentheses/issues>.
 
