#!/usr/bin/perl -w

use DateTime;
$currentDate = DateTime->now();
$archiveFilename = "public_html_backup$currentDate.tar.gz";
$command = "tar -czvf $archiveFilename /home/justin/public_html";

$ignoresFilename = 'ignore.txt';
if(-e $ignoresFilename) {
	open(FILE, $ignoresFilename) or die 'Error reading the settings file';
	chomp(@ignores = <FILE>);
	foreach (@ignores) {
		$command .= " --exclude='$_'";
	}
	close(FILE);
}

print $command;
