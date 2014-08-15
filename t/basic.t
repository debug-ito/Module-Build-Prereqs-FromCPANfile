use strict;
use warnings;
use Test::More;
use Module::Build::Prereqs::FromCPANfile;

my %input_base = (cpanfile => "t/mixed.cpanfile");  ## should we use File::Spec??

my @testcases = (
    { input => {version => "0.10"},
      desc => "configure_requires and test_requires is not supported",
      exp => {
        requires => {
            perl => "5.14.0",
            NoVersion => "0",
            WithVersion => "1.100",
            WithDottedVersion => "v2.9.0",
            WithExactVersion => "== 3.000",
        },
        recommends => {
            RuntimeRecommends => "2",
        },
        conflicts => {
            RuntimeConflicts => 10,
        },
        build_requires => {
            BuildRequires => "2.10",
            TestRequires => "1.10",
            ConfigureRequires => "4.10",
        },
    } },

    { input => {version => "0.35"},
      desc => "configure_requires is supported, but test_requires is not",
      exp => {
        requires => {
            perl => "5.14.0",
            NoVersion => "0",
            WithVersion => "1.100",
            WithDottedVersion => "v2.9.0",
            WithExactVersion => "== 3.000",
        },
        recommends => {
            RuntimeRecommends => "2",
        },
        conflicts => {
            RuntimeConflicts => 10,
        },
        build_requires => {
            BuildRequires => "2.10",
            TestRequires => "1.10",
        },
        configure_requires => {
            ConfigureRequires => "4.10",
        },
    } },

    { input => {version => "0.41"},
      desc => "configure_requires and test_requires are supported",
      exp => {
        requires => {
            perl => "5.14.0",
            NoVersion => "0",
            WithVersion => "1.100",
            WithDottedVersion => "v2.9.0",
            WithExactVersion => "== 3.000",
        },
        recommends => {
            RuntimeRecommends => "2",
        },
        conflicts => {
            RuntimeConflicts => 10,
        },
        build_requires => {
            BuildRequires => "2.10",
        },
        configure_requires => {
            ConfigureRequires => "4.10",
        },
        test_requires => {
            TestRequires => "1.10",
        },
    } }
);

foreach my $case (@testcases) {
    my %input = (%input_base, %{$case->{input}});
    is_deeply {mb_prereqs_from_cpanfile(%input)}, $case->{exp}, "MB version $input{version}: $case->{desc}";
}

done_testing;
