
# Data that drives the create step picker registration for this plugin.
my %runRuby = (
    label       => "Ruby - Run Ruby",
    procedure   => "runRuby",
    description => "Integrates Ruby Scripting into Electric Commander",
    category    => "Scripting/Shell"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/Ruby");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Ruby - Run Ruby");

@::createStepPickerSteps = (\%runRuby);
