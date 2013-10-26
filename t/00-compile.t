use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.033

use Test::More  tests => 24 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'MarpaX/Languages/ECMA/AST.pm',
    'MarpaX/Languages/ECMA/AST/Grammar.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/Base.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/CharacterClasses.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Base.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/CharacterClasses.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical/NumericLiteral.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical/NumericLiteral/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical/RegularExpressionLiteral.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical/RegularExpressionLiteral/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical/StringLiteral.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Lexical/StringLiteral/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Pattern/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Program.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Program/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Uri.pm',
    'MarpaX/Languages/ECMA/AST/Grammar/ECMA_262_5/Uri/Actions.pm',
    'MarpaX/Languages/ECMA/AST/Impl.pm',
    'MarpaX/Languages/ECMA/AST/Impl/Logger.pm',
    'MarpaX/Languages/ECMA/AST/Util.pm'
);



# fake home for cpan-testers
use File::Temp;
local $ENV{HOME} = File::Temp::tempdir( CLEANUP => 1 );


use File::Spec;
use IPC::Open3;
use IO::Handle;

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, '-Mblib', '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($? >> 8, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


