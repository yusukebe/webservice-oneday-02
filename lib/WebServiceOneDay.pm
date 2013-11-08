package WebServiceOneDay;
use strict;
use warnings;
use Text::Markdown qw/markdown/;
use Path::Class qw/file/;
use Encode qw/decode_utf8/;
use Data::Section::Simple qw/get_data_section/;
use Text::MicroTemplate qw/render_mt/;

sub markdown2html {
    my $file = shift;
    my $path = file($file) or die "Cannot find $file";
    my $content = $path->slurp;
    my ($title) = $content =~ m!^#\s+([^#]+?)\n!;
    my $html = render_mt(get_data_section('head.html'), $title)->as_string;
    $html .= markdown($content);
    $html .= get_data_section('foot.html');
    return $html;
}

1;

__DATA__

@@ head.html
<html>
<head>
  <meta charset="utf-8">
  <title><?= $_[0] ?></title>
  <link href="js/pretty/prettify.css" type="text/css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link rel="stylesheet" type="text/css" href="css/print.css" media="print" />
</head>
<body>
<div id="content">

@@ foot.html
</div>
<script type="text/javascript" src="js/pretty/prettify.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery.scrollTo-min.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</body>
</html>
