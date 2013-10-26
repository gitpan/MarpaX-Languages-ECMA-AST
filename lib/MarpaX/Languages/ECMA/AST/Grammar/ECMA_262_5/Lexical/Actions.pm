use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::Actions;
use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::CharacterClasses qw//;

our $LF = chr(0x000A);

# ABSTRACT: ECMA 262, Edition 5, lexical grammar actions

our $VERSION = '0.001'; # TRIAL VERSION



sub new {
    my $class = shift;
    my $self = {};
    bless($self, $class);
    return $self;
}

# Comments behave like white space and are discarded except that, if a MultiLineComment contains a line
# terminator character, then the entire comment is considered to be a LineTerminator for purposes of parsing by
# the syntactic grammar.


sub Comment {
    my ($self, $Commentp) = @_;

    #
    # lexeme is [start, length, value]
    #
    if (substr($Commentp->[0]->[2], 0, 2) eq '/*') {
	if ($Commentp->[0]->[2] =~ /[\p{MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::CharacterClasses::IsLineTerminator}]/) {
	    $Commentp->[0] = bless [
		$Commentp->[0]->[0],
		$Commentp->[0]->[1],
		$LF], 'ECMA_262_5::AST::LineTerminator';
	} else {
	    $Commentp->[0] = undef;
	}
    } else {
	$Commentp->[0] = undef;
    }

    return $Commentp;
}


sub RemoveUndefinedComment {
    my ($self, $InputElementsp) = @_;

    return [ grep {defined($_->[0]->[0])} @{$InputElementsp}];
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Lexical::Actions - ECMA 262, Edition 5, lexical grammar actions

=head1 VERSION

version 0.001

=head1 DESCRIPTION

This modules give the actions associated to ECMA_262_5 lexical grammar.

=head2 new($class)

Instantiate a new object.

=head2 Comment($self, $commentp)

Comment action.

=head2 RemoveUndefinedComment($self, $InputElementsp)

RemoveUndefinedComment action.

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
