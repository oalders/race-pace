# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.031.
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Race pace calculations for runners",
  "AUTHOR" => "Olaf Alders <olaf\@wundercounter.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "RacePace",
  "EXE_FILES" => [
    "script/pace2time.pl",
    "script/time2pace.pl",
    "script/tri.pl"
  ],
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.010000",
  "NAME" => "RacePace",
  "PREREQ_PM" => {
    "CLDR::Number::Format::Decimal" => 0,
    "DateTime" => 0,
    "DateTime::Duration" => 0,
    "Moo" => 0,
    "Moo::Role" => 0,
    "MooX::Options" => 0,
    "Types::Common::Numeric" => 0,
    "Types::Standard" => 0,
    "feature" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Test2::Bundle::More" => 0,
    "Test2::Plugin::BailOnFail" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.000001",
  "test" => {
    "TESTS" => "t/*.t t/RacePace/*.t"
  }
);


my %FallbackPrereqs = (
  "CLDR::Number::Format::Decimal" => 0,
  "DateTime" => 0,
  "DateTime::Duration" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "Moo" => 0,
  "Moo::Role" => 0,
  "MooX::Options" => 0,
  "Test2::Bundle::More" => 0,
  "Test2::Plugin::BailOnFail" => 0,
  "Test::More" => 0,
  "Types::Common::Numeric" => 0,
  "Types::Standard" => 0,
  "feature" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
