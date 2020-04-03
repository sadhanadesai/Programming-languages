#!/usr/bin/perl
use strict;
use warnings;
open FILE, "input.txt" or die $!;
while(my $single_word = <FILE>)
{
if($single_word =~m/or/)
{
chomp $single_word;
print("$single_word contains or \n");
}

my @vowel = qw (a e i o u);
foreach my $string ($single_word) {
    my $count = 0;
	my $i = 0;
    while($i <= (length $string) - 1)
	{
	$i++;
        my $name = substr($string, $i, 1 );
        $count++ if ( grep /\b$name\b/, @vowel );
    }
 
if($single_word =~m/.e/ && $single_word =~m/y\b/)
{
chomp $single_word;
print("$single_word has e as the second symbol and ends with y\n");
}

if ( $count >= 2 ){
    chomp $single_word;
print ("$single_word contains at least two vowels letters \n");
}


if($single_word !~m/^h/)
{
chomp $single_word;
print("$single_word does not start with h \n");
}

if($single_word =~m/[0-9]/ && $single_word =~m/[a-z]/)
{
chomp $single_word;
print("$single_word contains both letters and digits \n");
}
}
}
close(FILE);