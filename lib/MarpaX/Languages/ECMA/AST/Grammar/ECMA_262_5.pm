use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5;
use MarpaX::Languages::ECMA::AST::Impl;
use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Program;

# ABSTRACT: ECMA-262, Edition 5, grammar

our $VERSION = '0.001'; # TRIAL VERSION


sub new {
  my ($class) = @_;

  my $self  = {};

  bless($self, $class);

  $self->_init();

  return $self;
}

sub _init {
    my ($self) = @_;

    my $grammar = MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Program->new();
    my $grammar_option = $grammar->grammar_option();
    $grammar_option->{bless_package} = 'ECMA_262_5::AST';
    $grammar_option->{source} = \$grammar->content();
    my $recce_option = $grammar->recce_option();
    $self->{_program} = {
	grammar => $grammar,
	impl => MarpaX::Languages::ECMA::AST::Impl->new($grammar_option, $recce_option)
    };

}


sub program {
    my ($self) = @_;

    return $self->{_program};
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5 - ECMA-262, Edition 5, grammar

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5;

    my $ecma = MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5->new();

    my $program = $ecma->program();

=head1 DESCRIPTION

This modules returns all grammars needed for the ECMA 262, Edition 5 grammars written in Marpa BNF, as of L<http://www.ecma-international.org/publications/standards/Ecma-262.htm>.

=head1 SUBROUTINES/METHODS

=head2 new()

Instance a new object.

=head2 program()

Returns the program grammar as a hash reference that is

=over

=item grammar

A MarpaX::Languages::ECMA::AST::Grammar::Base object

=item impl

A MarpaX::Languages::ECMA::AST::Impl object

=back

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
