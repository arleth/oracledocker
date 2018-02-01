#!/usr/bin/perl  
use strict;  
use DBI;  
print "Content-type: text/html\n\n";  
my $dbh = DBI->connect(  
    "dbi:mysql:dbname=webdb;host=db",  
        "webuser",  
        "secret",  
        { RaiseError => 1 },  
) or die $DBI::errstr;  
my $sth = $dbh->prepare( "SELECT * FROM People WHERE Age > $ARGV[0]" );  
$sth->execute();  
my $fields = $sth->{NUM_OF_FIELDS};  
my $rows = $sth->rows();  
print "Selected $rows row(s) with $fields field(s)\n";  
for ( 1 .. $rows ) {  
    my ($id, $name, $age) = $sth->fetchrow();  
    print "$id $name $age\n";  
}  
$sth->finish();  
$dbh->disconnect();  