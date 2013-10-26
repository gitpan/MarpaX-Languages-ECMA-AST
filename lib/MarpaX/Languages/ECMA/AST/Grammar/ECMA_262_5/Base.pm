use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base;
use parent qw/MarpaX::Languages::ECMA::AST::Grammar::Base/;
use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::CharacterClasses qw//;
use SUPER;

# ABSTRACT: ECMA-262, Edition 5, grammars base package

our $VERSION = '0.001'; # TRIAL VERSION


sub new {
  my ($class, $grammar, $package) = @_;

  return $class->SUPER($grammar, $package, 'ECMA_262_5');

}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base - ECMA-262, Edition 5, grammars base package

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5::Base;

    my $grammar = MarpaX::Languages::ECMA::AST::Grammar::ECMA_262_5->new("grammar", "My::Package");

    my $grammar_content = $grammar->content();
    my $grammar_option = $grammar->grammar_option();
    my $recce_option = $grammar->recce_option();

=head1 DESCRIPTION

This modules subclasses MarpaX::Languages::ECMA::AST::Grammar::Base for the ECMA-262 specification.

=head1 SUBROUTINES/METHODS

=head2 new($grammar, $package)

Instance a new object. Takes a grammar and package name as required parameters.

=head1 SEE ALSO

L<MarpaX::Languages::ECMA::AST::Grammar::Base>

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
