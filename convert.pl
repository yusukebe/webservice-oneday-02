#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use WebServiceOneDay;
use File::Spec;
use Path::Class qw/file/;

my $path = File::Spec->catfile("$FindBin::Bin/text.mkdn");
my $html = WebServiceOneDay::markdown2html($path);
my $output = file("$FindBin::Bin/index.html");
my $fh = $output->open('w');
print $fh $html;
close $fh;
