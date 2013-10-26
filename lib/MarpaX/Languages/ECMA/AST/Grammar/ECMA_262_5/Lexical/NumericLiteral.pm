use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::NumericLiteral;
use parent qw/MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base/;
use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::NumericLiteral::Actions;
use Carp qw/croak/;
use Log::Any qw/$log/;
use SUPER;

# ABSTRACT: ECMA-262, Edition 5, lexical numeric grammar written in Marpa BNF

our $VERSION = '0.001'; # TRIAL VERSION



sub new {
    my ($class) = @_;

    #
    # Prevent injection of this grammar to collide with others:
    # ___yy is changed to ___StringLiteral___yy
    #
    my $grammar_source = do {local $/; <DATA>};
    $grammar_source =~ s/___/___NumericLiteral___/g;

    return $class->SUPER($grammar_source, __PACKAGE__);
}


sub parse {
    my ($self, $sourcep, $impl) = @_;
    return $self->SUPER($sourcep, $impl,
	{
	 #   '_DecimalLiteral$'     => \&_DecimalLiteral,
	 #   '_HexIntegerLiteral$'  => \&_HexIntegerLiteral,
	 #   '_OctalIntegerLiteral$'=> \&_OctalIntegerLiteral,
	 #   '_IdentifierName$'     => \&_IdentifierName
	});
}

sub _DecimalLiteral {
    my ($self, $lexemeHashp, $sourcep, $impl) = @_;

    $self->_NumericLiteralLookhead($lexemeHashp, $sourcep, $impl);
}


1;

=pod

=encoding utf-8

=head1 NAME

MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::NumericLiteral - ECMA-262, Edition 5, lexical numeric grammar written in Marpa BNF

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::NumericLiteral;

    my $grammar = MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::NumericLiteral->new();

    my $grammar_content = $grammar->content();
    my $grammar_option = $grammar->grammar_option();
    my $recce_option = $grammar->recce_option();

=head1 DESCRIPTION

This modules returns describes the ECMA 262, Edition 5 lexical decimal grammar written in Marpa BNF, as of L<http://www.ecma-international.org/publications/standards/Ecma-262.htm>. This module inherits the methods from MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base package.

=head1 SUBROUTINES/METHODS

=head2 new()

Instance a new object.

=head2 parse($self, $sourcep)

Parse the source given as reference to a scalar.

=head1 SEE ALSO

L<MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base>

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__DATA__
# ==================================
# ECMA Script Lexical Decimal Grammar
# ==================================
#
# The source text of an ECMAScript program is first converted into a sequence of input elements, which are
# tokens, line terminators, comments, or white space.
#
:start ::= __NumericLiteral
:default ::= action => [values] bless => ::lhs
lexeme default = action => [start,length,value]

__NumericLiteral ::=
    __DecimalLiteral
  | __HexIntegerLiteral
  | __OctalIntegerLiteral

#
# DO NOT REMOVE NOR MODIFY THIS LINE
#
# This grammar is injected in Lexical grammar, with the following modifications:
# action => xxx              are removed
# __xxx\s*::=\s*               are changed to __xxx ~
#

__DecimalDigitsopt ::= __DecimalDigits
__DecimalDigitsopt ::=

__ExponentPartopt ::= __ExponentPart
__ExponentPartopt ::=

__DecimalLiteral ::= __DecimalIntegerLiteral '.' __DecimalDigitsopt __ExponentPartopt
                 | '.' __DecimalDigits __ExponentPartopt
                 | __DecimalIntegerLiteral __ExponentPartopt

__DecimalIntegerLiteral ::= '0'
                        | ___NonZeroDigit __DecimalDigitsopt

__DecimalDigits ::= ___DecimalDigit
                | __DecimalDigits ___DecimalDigit

__ExponentPart ::= ___ExponentIndicator __SignedInteger

__SignedInteger ::= __DecimalDigits
                | '+' __DecimalDigits
                | '-' __DecimalDigits

__HexIntegerLiteral ::= __HexIntegerLiteralInternal

__HexIntegerLiteralInternal ::= '0x' ___HexDigit
                    | '0X' ___HexDigit
                    | __HexIntegerLiteralInternal ___HexDigit

__OctalIntegerLiteral ::= __OctalIntegerLiteralInternal

__OctalIntegerLiteralInternal ::= '0' ___OctalDigit
                                | __OctalIntegerLiteralInternal ___OctalDigit

#
# The ___ are to prevent errors with eventual duplicate rules when injecting
# this grammar in Lexical's grammar
#
___OctalDigit ~ [\p{IsOctalDigit}]
___HexDigit  ~ [\p{IsHexDigit}]
___ExponentIndicator ~ [\p{IsExponentIndicator}]
___NonZeroDigit      ~ [\p{IsNonZeroDigit}]
___DecimalDigit      ~ [\p{IsDecimalDigit}]
