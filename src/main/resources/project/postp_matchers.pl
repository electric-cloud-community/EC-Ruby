@::gMatchers = (
  #ruby stabdard errors: NameError, ZeroDivisionError, NoMethodError, etc
  {
   id =>        "StandardError",
   pattern =>          q{\((.*)(Error)\)},
   action =>           q{&addSimpleError("StandardError", "$1 $2");setProperty("outcome", "error" );updateSummary();},
  },
);

sub addSimpleError {
    my ($name, $customError) = @_;
    if(!defined $::gProperties{$name}){
        setProperty ($name, $customError);
    }
}

sub updateSummary() {
 
    my $summary = (defined $::gProperties{"StandardError"}) ? $::gProperties{"StandardError"} . "\n" : "";

    setProperty ("summary", $summary);
}