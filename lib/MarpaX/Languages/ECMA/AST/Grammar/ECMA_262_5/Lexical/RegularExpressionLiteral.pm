use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::RegularExpressionLiteral;
use parent qw/MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base/;
use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::RegularExpressionLiteral::Actions;
use Carp qw/croak/;
use Log::Any qw/$log/;
use SUPER;

# ABSTRACT: ECMA-262, Edition 5, lexical string grammar written in Marpa BNF

our $VERSION = '0.001'; # TRIAL VERSION



#
# Prevent injection of this grammar to collide with others:
# ___yy is changed to ___StringLiteral___yy
#
our $grammar_source = do {local $/; <DATA>};
$grammar_source =~ s/___/___RegularExpressionLiteral___/g;

sub new {
    my ($class) = @_;

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

MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::RegularExpressionLiteral - ECMA-262, Edition 5, lexical string grammar written in Marpa BNF

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::RegularExpressionLiteral;

    my $grammar = MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::RegularExpressionLiteral->new();

    my $grammar_content = $grammar->content();
    my $grammar_option = $grammar->grammar_option();
    my $recce_option = $grammar->recce_option();

=head1 DESCRIPTION

This modules returns describes the ECMA 262, Edition 5 lexical string grammar written in Marpa BNF, as of L<http://www.ecma-international.org/publications/standards/Ecma-262.htm>. This module inherits the methods from MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base package.

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
# ECMA Script Lexical String Grammar
# ==================================
#
# The source text of an ECMAScript program is first converted into a sequence of input elements, which are
# tokens, line terminators, comments, or white space.
#
:start ::= __RegularExpressionLiteral
lexeme default = action => [start,length,value]

#
# DO NOT REMOVE NOR MODIFY THIS LINE
#
# This grammar is injected in Lexical grammar, with the following modifications:
# action => xxx              are removed
# __xxx\s*::=\s*               are changed to __xxx ~
#
__RegularExpressionLiteral ::= '/' __RegularExpressionBody '/' __RegularExpressionFlags

__RegularExpressionBody ::= __RegularExpressionFirstChar __RegularExpressionChars

__RegularExpressionChars ::=
__RegularExpressionChars ::= __RegularExpressionChars __RegularExpressionChar

__RegularExpressionFirstChar ::= ___RegularExpressionNonTerminatorButNotOneOfStarOrBackslashOrSlashOrLbracket
                             | __RegularExpressionBackslashSequence
                             | __RegularExpressionClass

__RegularExpressionChar ::= ___RegularExpressionNonTerminatorButNotOneOfBackslashOrSlashOrLbracket
                        | __RegularExpressionBackslashSequence
                        | __RegularExpressionClass


__RegularExpressionBackslashSequence ::= '\' __RegularExpressionNonTerminator
                                     # ' for my editor

__RegularExpressionNonTerminator ::= ___RegularExpressionSourceCharacterButNotLineTerminator

__RegularExpressionClass ::= '[' __RegularExpressionClassChars ']'

__RegularExpressionClassChars ::=
__RegularExpressionClassChars ::= __RegularExpressionClassChars __RegularExpressionClassChar

__RegularExpressionClassChar ::= ___RegularExpressionNonTerminatorButNotOneOfRbracketOrBackslash
                             | __RegularExpressionBackslashSequence

__RegularExpressionFlags ::=
__RegularExpressionFlags ::= __RegularExpressionFlags ___IdentifierPart

___IdentifierPart ~ ___IdentifierStart
                  | ___UnicodeCombiningMark
                  | ___UnicodeDigit
                  | ___UnicodeConnectorPunctuation
                  | ___ZWNJ
                  | ___ZWJ

___IdentifierStart ~ ___UnicodeLetter
                   | '$'
                   | '_'
                   | '\' ___UnicodeEscapeSequence
                   # ' for my editor

___UnicodeEscapeSequence                  ~ 'u' ___HexDigit ___HexDigit ___HexDigit ___HexDigit

___RegularExpressionNonTerminatorButNotOneOfStarOrBackslashOrSlashOrLbracket ~ [\p{IsRegularExpressionNonTerminatorButNotOneOfStarOrBackslashOrSlashOrLbracket}]
___RegularExpressionNonTerminatorButNotOneOfBackslashOrSlashOrLbracket       ~ [\p{IsRegularExpressionNonTerminatorButNotOneOfBackslashOrSlashOrLbracket}]
___RegularExpressionSourceCharacterButNotLineTerminator                      ~ [\p{IsSourceCharacterButNotLineTerminator}]
___RegularExpressionNonTerminatorButNotOneOfRbracketOrBackslash              ~ [\p{IsRegularExpressionNonTerminatorButNotOneOfRbracketOrBackslash}]
___UnicodeLetter                          ~ [\p{IsUnicodeLetter}]
___ZWNJ                        ~ [\p{IsZWJ}]
___ZWJ                         ~ [\p{IsZWJ}]
___UnicodeCombiningMark        ~ [\p{IsUnicodeCombiningMark }]
___UnicodeDigit                ~ [\p{IsUnicodeDigit}]
___UnicodeConnectorPunctuation ~ [\p{IsUnicodeConnectorPunctuation}]
___HexDigit          ~ [\p{IsHexDigit}]
