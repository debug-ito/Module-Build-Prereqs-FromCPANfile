package Module::Build::Prereqs::FromCPANfile;
use strict;
use warnings;

our $VERSION = "0.01";

1;
__END__

=pod

=head1 NAME

Module::Build::Prereqs::FromCPANfile - construct prereq parameters of Module::Build from cpanfile

=head1 SYNOPSIS

    use Module::Build;
    use Module::Build::Prereqs::FromCPANfile;
    
    Module::Build->new(
        ...,
        mb_prereqs_from_cpanfile()
    )->create_build_script();


=head1 DESCRIPTION

This simple module reads L<cpanfile> and converts its content into
valid prereq parameters for C<new()> method of L<Module::Build>.

Currently it does not support "optional features" specification (See L<cpanfile/feature>).

=head1 EXPORTED FUNCTION

The following function is exported by default.

=head2 %prereq_params = mb_prereqs_from_cpanfile(%args)

Reads L<cpanfile>, parses its content and returns corresponding C<%prereq_params> for L<Module::Build>.

Fields in C<%args> are:

=over

=item C<version> => VERSION_STR (optional, default: $Module::Build::VERSION)

Version number of the target L<Module::Build>.

If ommited, L<Module::Build> is loaded and C<$Module::Build::VERSION> is used.

=item C<cpanfile> => FILEPATH (optional, default: "cpanfile")

File path to the cpanfile to be loaded.

If ommited, it loads "cpanfile" in the current directory.

=back


=head1 SEE ALSO

=over

=item L<Module::Build::Pluggable::CPANfile>

Maybe this module does the same job better, but it has heavier dependency.

=back

=head1 REPOSITORY

L<https://github.com/debug-ito/Module-Build-Prereqs-FromCPANfile>

=head1 BUGS AND FEATURE REQUESTS

Please report bugs and feature requests to my Github issues
L<https://github.com/debug-ito/Module-Build-Prereqs-FromCPANfile/issues>.

Although I prefer Github, non-Github users can use CPAN RT
L<https://rt.cpan.org/Public/Dist/Display.html?Name=Module-Build-Prereqs-FromCPANfile>.
Please send email to C<bug-Module-Build-Prereqs-FromCPANfile at rt.cpan.org> to report bugs
if you do not have CPAN RT account.


=head1 AUTHOR
 
Toshio Ito, C<< <toshioito at cpan.org> >>


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Toshio Ito.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.


=cut

