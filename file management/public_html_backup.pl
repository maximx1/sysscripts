#!/usr/bin/perl -w

use DateTime;
use File::Basename;
$dirname = dirname(__FILE__);
$currentDate = DateTime->now();
$archiveFilename = "/home/justin/backups/public_html_backup/public_html_backup$currentDate.tar.gz";
$archiveFilename =~ s/:/-/g;
$command = "cd /home/justin/ && tar -czvf $archiveFilename public_html";

$ignoresFilename = "$dirname/ignore.txt";
if(-e $ignoresFilename) {
	open(FILE, $ignoresFilename) or die 'Error reading the settings file';
	chomp(@ignores = <FILE>);
	foreach (@ignores) {
		$command .= " --exclude='$_'";
	}
	close(FILE);
}

$command .= " && cd -";

print `$command`;
print "done";
