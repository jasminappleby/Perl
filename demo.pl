#!/usr/bin/perl

print("What is your name: \n");
$name = <STDIN>;
print("Hello, $name\n");

print("What is the temperture today?\n");
$weather = (<STDIN> ); 

if ($weather =~ /^-?\d+$/) {
    if($weather <= 8) {
        print "Please wrap up warm. We are talking scarfs, hats and gloves.\n";
    } elsif ($weather > 8 && $weather <= 15) {
        print "You can get away with a jumper or a hoodie in this weather, but maybe wear a light jacket.\n";
    } elsif ($weather > 15 && $weather <= 22) {
        print "Getting warm out there! Jumpers and hoodies, or maybe even a long sleeve!\n";
    } elsif ($weather > 22 && $weather <=28) {
        print "Officially a scorcher!! Get the paddling pool and the BBQ out!\n";
    } elsif ($weather > 28 && $weather <=35) {
        print "I am so sorry for this weather, try to stay alive <3\n";
    } elsif ($weather => 35) {
        print "No chance you are in the UK...\n";
    } else {
        print "Probably too hot or too cold for this if else statement to consider..";
    }
} else {
    print "That is not a not a valid number... moving on. What a weirdo... \n";
}
print "\n\nLet's read a file: \n\n";

#setting my filename to a txt in the same dir
$filename = 'demo.txt';

# creating a sub is like creating a class we can use again and again when we call it
sub print_file_contents {
    my ($filename) = @_;
        open($fh, "<", $filename) or die "could not open filename $filename";
        while ($row = <$fh>) { #for each line in the file, store each line in the variable row
            chomp($row); #chomp is a built in perl function, It returns the total number of characters removed from all its arguments. 
                            # It's often used to remove the newline from the end of an input record when you're worried that the final record may be missing its newline. 
            print("$row\n"); #print line of content  
        }
        close($fh); #good practise to close file when youre done, however this guys tut sucks so ion believe him
}

print_file_contents($filename);

#this is appending to the file, which i suppose could be another sub, however im doing it once so not neccesary really imo 
open($fh, ">>", $filename); # >> appends to the file
print "\nAdd a new name to the list: \n";
$newname = <STDIN>;
print($fh $newname);
print "Added $newname\nUpdated List: \n\n";

print_file_contents($filename);