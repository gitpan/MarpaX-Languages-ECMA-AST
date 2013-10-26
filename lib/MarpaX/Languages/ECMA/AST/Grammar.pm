use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST::Grammar;

# ABSTRACT: ECMA grammar written in Marpa BNF

use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5;
use Carp qw/croak/;

our $VERSION = '0.001'; # TRIAL VERSION


sub new {
  my $class = shift;
  my $grammarName = shift;

  my $self = {};
  if (! defined($grammarName)) {
    croak 'Usage: new($grammar_Name)';
  } elsif ($grammarName eq 'ECMA-262-5') {
    $self->{_grammar} = MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5->new(@_);
  } else {
    croak "Unsupported grammar name $grammarName";
  }
  bless($self, $class);

  return $self;
}


sub program {
    my ($self) = @_;
    return $self->{_grammar}->program();
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

MarpaX::Languages::ECMA::AST::Grammar - ECMA grammar written in Marpa BNF

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use MarpaX::Languages::ECMA::AST::Grammar;

    my $grammar = MarpaX::Languages::ECMA::AST::Grammar->new('ECMA-262-5');
    my $grammar_content = $grammar->content();
    my $grammar_option = $grammar->grammar_option();
    my $recce_option = $grammar->recce_option();

=head1 DESCRIPTION

This modules returns ECMA grammar(s) written in Marpa BNF.
Current grammars are:
=over
=item *
ECMA-262-5. The ECMA-262, Edition 5, as of L<http://www.ecma-international.org/publications/standards/Ecma-262.htm>.
=back

=head1 SUBROUTINES/METHODS

=head2 new($class, $grammarName)

Instance a new object. Takes the name of the grammar as argument. Remaining arguments are passed to the sub grammar method. Supported grammars are:

=over

=item ECMA-262-5

ECMA-262, Edition 5

=back

=head2 program($self)

Returns the program grammar as a reference to hash that is

=over

=item grammar

A MarpaX::Languages::ECMA::AST::Grammar::Base object

=item impl

A MarpaX::Languages::ECMA::AST::Impl object

=back

=head1 SEE ALSO

L<Marpa::R2>

L<MarpaX::Languages::ECMA::AST>

L<MarpaX::Languages::ECMA::AST::Grammar::Base>

L<MarpaX::Languages::ECMA::AST::Impl>

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
