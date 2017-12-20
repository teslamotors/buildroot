#!/usr/bin/perl

use strict;
use warnings;

sub version {
  my ($verdots, $verndots);

  open(my $fh, "<readline.mk") or die "open(readline.mk)";

  foreach my $line (<$fh>) {
    if ($line =~ m/READLINE_VERSION\s*=\s*(\d+)\.(\d+)/) {
      $verdots = "$1.$2";
      $verndots = "$1$2";
      last;
    }
  }

  close($fh);

  die "Can't find READLINE_VERSION in readline.mk!\n" unless defined($verdots) and defined($verndots);

  return ($verdots, $verndots);
}

sub fixit {
  my ($pf, $tf) = @_;
  open(my $fh, "<$pf") or die "open($pf)";
  open(my $oh, ">$tf") or die "open($tf)";

  while (my $line=<$fh>) {
    chomp($line);
    if ($line =~ m|^(.+\s)(\.\./readline-[^/]+)/(\S+)(\s.+)$|) {
      # Transform patch lines that look like:
      #    *** ../readline-5.2/display.c	Thu Sep 14 14:20:12 2006
      #    --- display.c	Mon Nov 13 17:55:57 2006
      # into:
      #    *** a/display.c	Thu Sep 14 14:20:12 2006
      #    --- b/display.c	Mon Nov 13 17:55:57 2006
      my ($s, $discard, $path, $e) = ($1, $2, $3, $4);
      my $nextline = <$fh>;
      chomp($nextline);
      $nextline =~ s|$path|b/$path|;
      $line = "${s}a/$path$e\n$nextline";
    }

    print $oh "$line\n";
  }

  close($oh);
  close($fh);

  unlink($pf);
}

my ($verdots, $verndots) = version();

# Patch numbers seem to start at 1 always.  Doubtful there will be more than 100 total.
foreach my $pv (1..100) {
  my $pn = sprintf("readline$verndots-%03d", $pv);
  my $tn = sprintf("%04d-$pn.patch", $pv);
  system("wget ftp://ftp.gnu.org/gnu/readline/readline-$verdots-patches/$pn") == 0 or last;
  fixit($pn, $tn);
}
