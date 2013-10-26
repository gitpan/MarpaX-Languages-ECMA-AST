use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses;
use Exporter 'import';

# ABSTRACT: ECMA, character classes

our $VERSION = '0.001'; # TRIAL VERSION


our @EXPORT_OK = qw/
Isb
IsBackslash
IsBOM
IsCaret
IsCR
IsDecimalDigit
IsDollar
IsDot
IsDquote
Ise
IsE
IsEight
IsEscapeCharacter
IsExponentIndicator
Isf
IsFF
IsHexDigit
IsLbracket
IsLcurly
IsLF
IsLineTerminator
IsLparen
IsLS
IsMinus
Isn
IsNBSP
IsNine
IsNonZeroDigit
IsOctalDigit
IsPatternCharacter
IsPipe
IsPlus
IsPS
IsQuestion_Mark
Isr
IsRbracket
IsRcurly
IsRegularExpressionNonTerminator
IsRegularExpressionNonTerminatorButNotOneOfBackslashOrSlashOrLbracket
IsRegularExpressionNonTerminatorButNotOneOfRbracketOrBackslash
IsRegularExpressionNonTerminatorButNotOneOfStarOrBackslashOrSlashOrLbracket
IsRparen
IsSingleEscapeCharacter
IsSlash
IsSourceCharacter
IsSourceCharacterButNotLineTerminator
IsSourceCharacterButNotOneOfBackslashOrRbracketorMinus
IsSourceCharacterButNotOneOfDquoteOrBackslashOrLineTerminator
IsSourceCharacterButNotOneOfEscapeCharacterOrLineTerminator
IsSourceCharacterButNotOneOfSlashOrStar
IsSourceCharacterButNotOneOfSlashOrStarOrLineTerminator
IsSourceCharacterButNotOneOfSquoteOrBackslashOrLineTerminator
IsSourceCharacterButNotSlash
IsSourceCharacterButNotStar
IsSourceCharacterButNotStarOrLineTerminator
IsSP
IsSquote
IsStar
Ist
IsTAB
Isu
IsUnicodeCombiningMark
IsUnicodeConnectorPunctuation
IsUnicodeDigit
IsUnicodeLetter
IsUSP
Isv
IsVT
IsWhiteSpace
Isx
IsZero
IsZeroToThree
IsFourToSeven
IsZWJ
IsZWNJ
/;
our %EXPORT_TAGS = ('all' => \@EXPORT_OK);

our $STAR            = sprintf('%x', ord('*'));
our $SLASH           = sprintf('%x', ord('/'));
our $BACKSLASH       = sprintf('%x', ord('\\'));
our $DQUOTE          = sprintf('%x', ord('"'));
our $SQUOTE          = sprintf('%x', ord("'"));
our $b               = sprintf('%x', ord('b'));
our $e               = sprintf('%x', ord('e'));
our $f               = sprintf('%x', ord('f'));
our $n               = sprintf('%x', ord('n'));
our $r               = sprintf('%x', ord('r'));
our $t               = sprintf('%x', ord('t'));
our $u               = sprintf('%x', ord('u'));
our $v               = sprintf('%x', ord('v'));
our $x               = sprintf('%x', ord('x'));
our $E               = sprintf('%x', ord('E'));
our $EIGHT           = sprintf('%x', ord('8'));
our $NINE            = sprintf('%x', ord('9'));
our $LBRACKET        = sprintf('%x', ord('['));
our $RBRACKET        = sprintf('%x', ord(']'));
our $LPAREN          = sprintf('%x', ord('('));
our $RPAREN          = sprintf('%x', ord(')'));
our $LCURLY          = sprintf('%x', ord('{'));
our $RCURLY          = sprintf('%x', ord('}'));
our $CARET           = sprintf('%x', ord('^'));
our $DOLLAR          = sprintf('%x', ord('$'));
our $DOT             = sprintf('%x', ord('.'));
our $PLUS            = sprintf('%x', ord('+'));
our $QUESTION_MARK   = sprintf('%x', ord('?'));
our $PIPE            = sprintf('%x', ord('|'));
our $MINUS           = sprintf('%x', ord('-'));
our $ZERO            = sprintf('%x', ord('0'));
our $ONE             = sprintf('%x', ord('1'));
our $TWO             = sprintf('%x', ord('2'));
our $THREE           = sprintf('%x', ord('3'));
our $FOUR            = sprintf('%x', ord('4'));
our $FIVE            = sprintf('%x', ord('5'));
our $SIX             = sprintf('%x', ord('6'));
our $SEVEN           = sprintf('%x', ord('7'));


sub IsWhiteSpace { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsTAB
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsVT
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsFF
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSP
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsNBSP
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBOM
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsUSP
END
}


sub IsSourceCharacter { return <<END;
+utf8::Any
END
}


sub IsZWNJ { return <<END;
200C
END
}


sub IsZWJ { return <<END;
200D
END
}


sub IsBOM { return <<END;
FEFF
END
}


sub IsTAB { return <<END;
0009
END
}


sub IsVT { return <<END;
000B
END
}


sub IsFF { return <<END;
000C
END
}


sub IsSP { return <<END;
0020
END
}


sub IsNBSP { return <<END;
00A0
END
}


sub IsUSP { return <<END;
+utf8::Zs
END
}


sub IsLF { return <<END;
000A
END
}


sub IsCR { return <<END;
000D
END
}


sub IsLS { return <<END;
2028
END
}


sub IsPS { return <<END;
2029
END
}


sub IsSourceCharacterButNotStar { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsStar
END
}


sub IsSourceCharacterButNotStarOrLineTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsStar
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLineTerminator
END
}


sub IsSourceCharacterButNotOneOfSlashOrStar { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSlash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsStar
END
}


sub IsSourceCharacterButNotSlash { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSlash
END
}


sub IsSourceCharacterButNotOneOfSlashOrStarOrLineTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSlash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsStar
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLineTerminator
END
}


sub IsLineTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLF
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsCR
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLS
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsPS
END
}


sub IsSourceCharacterButNotLineTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLineTerminator
END
}


sub IsUnicodeLetter { return <<END;
+utf8::Lu
+utf8::Ll
+utf8::Lt
+utf8::Lm
+utf8::Lo
+utf8::Nl
END
}


sub IsUnicodeCombiningMark { return <<END;
+utf8::Mn
+utf8::Mc
END
}


sub IsUnicodeDigit { return <<END;
+utf8::Nd
END
}


sub IsUnicodeConnectorPunctuation { return <<END;
+utf8::Pc
END
}


sub IsSourceCharacterButNotOneOfDquoteOrBackslashOrLineTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsDquote
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLineTerminator
END
}


sub IsSourceCharacterButNotOneOfSquoteOrBackslashOrLineTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSquote
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLineTerminator
END
}


sub IsSingleEscapeCharacter { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSquote
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsDquote
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Isb
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Isf
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Isn
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Isr
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Ist
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Isv
END
}

#
# Note: PosixDigit is a perl extension
#

sub IsDecimalDigit { return <<END;
+utf8::PosixDigit
END
}

#
# Note: PosixDigit is a perl extension
#

sub IsOctalDigit { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsDecimalDigit
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsEight
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsNine
END
}


sub IsNonZeroDigit { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsDecimalDigit
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsZero
END
}


sub IsEscapeCharacter { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSingleEscapeCharacter
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsDecimalDigit
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Isx
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Isu
END
}


sub IsSourceCharacterButNotOneOfEscapeCharacterOrLineTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsEscapeCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLineTerminator
END
}


sub IsRegularExpressionNonTerminator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLineTerminator
END
}


sub IsRegularExpressionNonTerminatorButNotOneOfStarOrBackslashOrSlashOrLbracket { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRegularExpressionNonTerminator
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsStar
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSlash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLbracket
END
}


sub IsRegularExpressionNonTerminatorButNotOneOfBackslashOrSlashOrLbracket { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRegularExpressionNonTerminator
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSlash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLbracket
END
}


sub IsRegularExpressionNonTerminatorButNotOneOfRbracketOrBackslash { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRegularExpressionNonTerminator
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRbracket
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
END
}

#
# Note: PosixXDigit is a perl extension

sub IsHexDigit { return <<END;
+utf8::PosixXDigit
END
}


sub IsExponentIndicator { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::Ise
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsE
END
}


sub IsPatternCharacter { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRegularExpressionNonTerminator
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsCaret
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsDollar
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsDot
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsStar
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsPlus
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsQuestion_Mark
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLparen
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRparen
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLbracket
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRbracket
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsLcurly
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRcurly
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsPipe
END
}


sub IsSourceCharacterButNotOneOfBackslashOrRbracketorMinus { return <<END;
+MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsSourceCharacter
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsBackslash
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsRbracket
-MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses::IsMinus
END
}

# -------------------------------------------------------------------


sub Isx { return <<END;
$x
END
}


sub Isu { return <<END;
$u
END
}


sub Isv { return <<END;
$v
END
}


sub IsStar { return <<END;
$STAR
END
}


sub IsBackslash { return <<END;
$BACKSLASH
END
}


sub IsCaret { return <<END;
$CARET
END
}


sub IsDollar { return <<END;
$DOLLAR
END
}


sub IsDot { return <<END;
$DOT
END
}


sub IsLparen { return <<END;
$LPAREN
END
}


sub IsRparen { return <<END;
$RPAREN
END
}


sub IsLcurly { return <<END;
$LCURLY
END
}


sub IsRcurly { return <<END;
$RCURLY
END
}


sub IsQuestion_Mark { return <<END;
$QUESTION_MARK
END
}


sub IsPlus { return <<END;
$PLUS
END
}


sub IsMinus { return <<END;
$MINUS
END
}


sub IsSquote { return <<END;
$SQUOTE
END
}


sub IsDquote { return <<END;
$DQUOTE
END
}


sub IsPipe { return <<END;
$PIPE
END
}


sub IsSlash { return <<END;
$SLASH
END
}


sub IsLbracket { return <<END;
$LBRACKET
END
}


sub IsRbracket { return <<END;
$RBRACKET
END
}



sub Isb { return <<END;
$b
END
}


sub Isf { return <<END;
$f
END
}


sub Ise { return <<END;
$e
END
}


sub IsE { return <<END;
$E
END
}


sub Isn { return <<END;
$n
END
}


sub Isr { return <<END;
$r
END
}


sub Ist { return <<END;
$t
END
}


sub IsZero { return <<END;
$ZERO
END
}


sub IsEight { return <<END;
$EIGHT
END
}


sub IsNine { return <<END;
$NINE
END
}


sub IsZeroToThree { return <<END;
$ZERO
$ONE
$TWO
$THREE
END
}


sub IsFourToSeven { return <<END;
$FOUR
$FIVE
$SIX
$SEVEN
END
}

__END__

=pod

=encoding utf-8

=head1 NAME

MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses - ECMA, character classes

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::ECMA::AST::Grammar::CharacterClasses;

=head2 IsWhiteSpace()

=head2 IsSourceCharacter()

=head2 IsZWNJ()

=head2 sub IsZWJ { return <<END;
()

=head2 IsBOM()

=head2 IsTAB()

=head2 IsVT()

=head2 IsFF()

=head2 IsSP()

=head2 IsNBSP()

=head2 IsUSP()

=head2 IsLF()

=head2 IsCR()

=head2 IsLS()

=head2 IsPS()

=head2 IsSourceCharacterButNotStar()

=head2 IsSourceCharacterButNotStarOrLineTerminator()

=head2 IsSourceCharacterButNotOneOfSlashOrStar()

=head2 IsSourceCharacterButNotSlash()

=head2 IsSourceCharacterButNotOneOfSlashOrStarOrLineTerminator()

=head2 IsLineTerminator()

=head2 IsSourceCharacterButNotLineTerminator()

=head2 IsUnicodeLetter()

=head2 IsUnicodeCombiningMark()

=head2 IsUnicodeDigit()

=head2 IsUnicodeConnectorPunctuation()

=head2 IsSourceCharacterButNotOneOfDquoteOrBackslashOrLineTerminator()

=head2 IsSourceCharacterButNotOneOfSquoteOrBackslashOrLineTerminator()

=head2 IsSingleEscapeCharacter()

=head2 IsDecimalDigit()

=head2 IsOctalDigit()

=head2 IsNonZeroDigit()

=head2 IsEscapeCharacter()

=head2 IsSourceCharacterButNotOneOfEscapeCharacterOrLineTerminator()

=head2 IsRegularExpressionNonTerminator()

=head2 IsRegularExpressionNonTerminatorButNotOneOfStarOrBackslashOrSlashOrLbracket()

=head2 IsRegularExpressionNonTerminatorButNotOneOfBackslashOrSlashOrLbracket()

=head2 IsRegularExpressionNonTerminatorButNotOneOfRbracketOrBackslash()

=head2 IsHexDigit()

=head2 IsExponentIndicator()

=head2 IsPatternCharacter()

=head2 IsSourceCharacterButNotOneOfBackslashOrRbracketorMinus()

=head2 Isx()

=head2 Isu()

=head2 Isv()

=head2 IsStar()

=head2 IsBackslash()

=head2 IsCaret()

=head2 IsDollar()

=head2 IsDot()

=head2 IsLparen()

=head2 IsRparen()

=head2 IsLcurly()

=head2 IsRcurly()

=head2 IsQuestion_Mark()

=head2 IsPlus()

=head2 IsMinus()

=head2 IsSquote()

=head2 IsDquote()

=head2 IsPipe()

=head2 IsSlash()

=head2 IsLbracket()

=head2 IsRbracket()

=head2 Isb()

=head2 Isf()

=head2 Ise()

=head2 IsE()

=head2 Isn()

=head2 Isr()

=head2 Ist()

=head2 IsZero()

=head2 IsEight()

=head2 IsNine()

=head2 IsZeroToThree()

=head2 IsFourToSeven()

=head1 DESCRIPTION

This modules defines generic user-defined character classes for ECMA. There is no notion of object here, only functions that can be imported using the tag qw/:all/.

=head1 EXPORTS

This module is exporting on demand the following tags:

=over

=item all

All functions.

=back

1;

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
