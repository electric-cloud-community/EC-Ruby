use strict;
use warnings;
use ElectricCommander;
$|=1;


########################################################################
# main - contains the whole process to be done by the plugin, it builds 
#        the command line, sets the properties and the working directory
#
# Arguments:
#   -none
#
# Returns:
#   -nothing
#
########################################################################
sub main() {
    my $ec = ElectricCommander->new();
    $ec->abortOnError(0);
    my $rubyLocation        = ($ec->getProperty( "rubyLocation" ))->findvalue('//value')->string_value;
    my $rubyCommand         = ($ec->getProperty( "rubyCommand" ))->findvalue('//value')->string_value;
    my $inputType           = ($ec->getProperty( "inputType" ))->findvalue('//value')->string_value;
    my $additionalCommands  = ($ec->getProperty( "additionalCommands" ))->findvalue('//value')->string_value;

	my @args = ();
    if ( $rubyLocation ne '' ) {
        push( @args, qq{"$rubyLocation"} );
    }
    else {
        push(@args, "ruby");
    }
    
    if($inputType && $inputType ne '' && $inputType eq "command") {
        push(@args,qq{-e '$rubyCommand'});
    }
	else{
        push(@args,qq{"$rubyCommand"});
    }
    
    if($additionalCommands && $additionalCommands ne ""){
        push(@args, $additionalCommands);
    }
    print join(" ",@args);
    $ec->setProperty("/myCall/rubyCommandLine", join(" ",@args));
}

main();

1;
