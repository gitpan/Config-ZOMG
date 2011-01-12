
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Yet Another Catalyst::Plugin::ConfigLoader-style layer over Config::Any',
  'AUTHOR' => 'Arthur Axel "fREW" Schmidt <frioux+cpan@gmail.com>, Robert Krimen <robertkrimen@gmail.com>',
  'BUILD_REQUIRES' => {
    'Test::Deep' => '0',
    'Test::More' => '0',
    'Test::Warn' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Config-ZOMG',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Config::ZOMG',
  'PREREQ_PM' => {
    'Clone' => '0',
    'Config::Any' => '0',
    'Hash::Merge::Simple' => '0',
    'List::Util' => '0',
    'Moo' => '0'
  },
  'VERSION' => '0.001000',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



