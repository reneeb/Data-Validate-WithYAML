#!/usr/bin/perl

use strict;
use warnings;

use File::Temp;
use Test::More;
use Data::Validate::WithYAML;

sub MODULE() { 'Data::Validate::WithYAML' }

{
    my $obj = MODULE()->new( '/tmp/data-validate-withyaml-test.yml' );
    is $obj, undef;
    is $Data::Validate::WithYAML::errstr, 'file does not exist';
}

{
    my $fh = File::Temp->new;
    $fh->print( '{"test":"hallo"}' );

    my $file = $fh->filename;
    close $fh;

    my $obj = MODULE()->new( $file );
    is $obj, undef;
    like $Data::Validate::WithYAML::errstr, qr/YAML::Tiny failed to classify/
}

done_testing();
