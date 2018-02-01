#!/usr/bin/perl  
use DBI;  
print "Content-type: text/html\n\n";  
my $dbh = DBI->connect(  
    "dbi:mysql:dbname=webdb:host=db",  
        "webuser",  
        "secret",  
        { RaiseError => 1 },  
) or die $DBI::errstr;  
my $sth = $dbh->prepare("SELECT VERSION()");  
$sth->execute();  
my $ver = $sth->fetch();  
print "Version = ", @$ver, "\n";  
$sth->finish();  
$dbh->disconnect()  