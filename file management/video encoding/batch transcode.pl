#!/usr/bin/perl -w

opendir($dir, "./") or die "Couldn't read directory!";
@files = grep !/^\.\.?$/, readdir $dir;

$filesListLength = $#files;
for($i = 0; $i < $filesListLength; $i++) {
	print $files[$i] . "\n";
	if($files[$i] eq $0) {
		splice(@files, $i, 1);
	}
	$filesListLength = $#files;
}

if($filesListLength > 0) {
	foreach(@files) {

		$_ =~ s/\s/\\ /g;

		$newFilename = substr($_, 0, -4) . ".mp4";
		$command = "avconv -i $_ -codec copy $newFilename";

		print `$command`;
	}
}
