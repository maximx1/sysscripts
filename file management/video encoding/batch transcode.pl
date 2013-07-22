#!/usr/bin/perl -w

opendir($dir, "./") or die "Couldn't read directory!";
@files = grep !/^\.\.?$/, readdir $dir;

$filesListLength = $#files;
for($i = 0; $i < $filesListLength; $i++) {
	if($files[$i] eq "transcode.pl") {
		splice(@files, $i, 1);
	}
	$filesListLength = $#files;
}

foreach(@files) {

	$_ =~ s/\s/\\ /g;

	$newFilename = substr($_, 0, -4) . ".mp4";
	$command = "avconv -i $_ -codec copy $newFilename";

	print `$command`;
}
