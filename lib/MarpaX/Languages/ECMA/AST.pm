use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::ECMA::AST;

# ABSTRACT: Translate a ECMA source to an AST

use Carp qw/croak/;
use MarpaX::Languages::ECMA::AST::Grammar qw//;

our $VERSION = '0.001'; # TRIAL VERSION


# ----------------------------------------------------------------------------------------
sub new {
  my ($class, %opts) = @_;

  my $grammarName = $opts{grammarName} || 'ECMA-262-5';

  my $grammar = MarpaX::Languages::ECMA::AST::Grammar->new($grammarName);

  my $self  = {
               _grammar            => $grammar,
               _sourcep            => undef,
              };

  bless($self, $class);

  return $self;
}

# ----------------------------------------------------------------------------------------


sub parse {
  my ($self, $sourcep) = @_;

  #
  # Step 1: parse the source
  #
  my $grammar     = $self->{_grammar}->program->{grammar};
  my $impl        = $self->{_grammar}->program->{impl};
  $grammar->parse($sourcep, $impl);
  $self->{_value} = $grammar->value($impl);
}


1;

__END__

=pod

=encoding utf-8

=head1 NAME

MarpaX::Languages::ECMA::AST - Translate a ECMA source to an AST

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use strict;
    use warnings FATAL => 'all';
    use MarpaX::Languages::ECMA::AST;
    use Log::Log4perl qw/:easy/;
    use Log::Any::Adapter;
    use Log::Any qw/$log/;
    use Data::Dumper;
    #
    # Init log
    #
    our $defaultLog4perlConf = '
    log4perl.rootLogger              = WARN, Screen
    log4perl.appender.Screen         = Log::Log4perl::Appender::Screen
    log4perl.appender.Screen.stderr  = 0
    log4perl.appender.Screen.layout  = PatternLayout
    log4perl.appender.Screen.layout.ConversionPattern = %d %-5p %6P %m{chomp}%n
    ';
    Log::Log4perl::init(\$defaultLog4perlConf);
    Log::Any::Adapter->set('Log4perl');
    #
    # Parse ECMA
    #
    my $ecmaSourceCode = 'select * from myTable;';
    my $ecmaAstObject = MarpaX::Languages::ECMA::AST->new();
    $log->infof('%s', $ecmaAstObject->parse(\$ecmaSourceCode));

=head1 DESCRIPTION

This module translates ECMA source into an AST tree. To assist further process of the AST tree, the nodes of the AST are blessed according to the ECMA grammar you have selected. (The default is 'ECMA-262-5'.) If you want to enable logging, be aware that this module is using Log::Any.

=head1 SUBROUTINES/METHODS

=head2 new($class, %options)

Instantiate a new object. Takes as parameter an optional hash of options that can be:

=over

=item grammarName

Name of a grammar. Default is 'ECMA-262-5'.

=back

=head2 parse($self, $sourcep)

Get and AST from the ECMA source, pointed by $sourcep. This method will call all the intermediary steps (lexical, transformation, evaluation) necessary to produce the AST.

=head1 SEE ALSO

L<Log::Any>, L<Marpa::R2>

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through the issue tracker
at L<https://rt.cpan.org/Public/Dist/Display.html?Name=MarpaX-Languages-ECMA-AST>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/jddurand/marpax-languages-ecma-ast>

  git clone git://github.com/jddurand/marpax-languages-ecma-ast.git

=head1 AUTHOR

Jean-Damien Durand <jeandamiendurand@free.fr>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jean-Damien Durand.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
