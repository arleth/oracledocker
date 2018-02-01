#!/usr/bin/perl  
use strict;  
use DBI;  
print "Content-type: text/html\n\n";  
my $dbh = DBI->connect(  
    "dbi:mysql:dbname=webdb:host=db",  
    "webuser",  
    "secret",  
    { RaiseError => 1}  
) or die $DBI::errstr;  
$dbh->do("DROP TABLE IF EXISTS People");  
$dbh->do("CREATE TABLE People(Id INT PRIMARY KEY, Name TEXT, Age INT) ENGINE=InnoDB");  
$dbh->do("INSERT INTO People VALUES(1,'Alice',42)");  
$dbh->do("INSERT INTO People VALUES(2,'Bobby',27)");  
$dbh->do("INSERT INTO People VALUES(3,'Carol',29)");  
$dbh->do("INSERT INTO People VALUES(4,'Daisy',20)");  
$dbh->do("INSERT INTO People VALUES(5,'Eddie',35)");  
$dbh->do("INSERT INTO People VALUES(6,'Frank',21)");  
my @noerr = ('Rows inserted in People table');  
print @noerr;  
print "\n";  
my $sth = $dbh->prepare( "SELECT * FROM People" );  
$sth->execute();  
  
for ( 1 .. $sth->rows() ) {  
    my ($id, $name, $age) = $sth->fetchrow();  
    print "$id $name $age\n";  
}  
$sth->finish();  
$dbh->disconnect();  
