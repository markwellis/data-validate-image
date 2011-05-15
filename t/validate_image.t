use strict;
use warnings;

use Test::More;
use Data::Validate::Image;
use Cwd 'abs_path';
use File::Basename;

my $dir = dirname( abs_path( $0 ) ) . "/test_data";
my @images = <${dir}/images/*>;
my @fakes = <${dir}/fakes/*>;

my $filelist = {
    'images' => \@images,
    'fakes' => \@fakes,
};
my $validator = new_ok('Data::Validate::Image');

my $convert_installed = `which convert`;

foreach my $image ( @{$filelist->{'images'}} ){
    my $image_info = $validator->validate( $image );
    isnt( $image_info, 0, "${image} is " . $image_info->{'file_ext'} );
    ok( $image_info->{'width'}, 'width defined ' . $image_info->{'width'} );
    ok( $image_info->{'height'}, 'height defined ' . $image_info->{'height'} );
    ok( $image_info->{'size'}, 'size defined ' . $image_info->{'size'} );
    ok( $image_info->{'file_ext'}, 'mime type defined ' . $image_info->{'file_ext'} );
    ok( $image_info->{'mime'}, 'file_ext defined ' . $image_info->{'mime'} );

    if ( $convert_installed ){
        if ( $image =~ m/^${dir}\/images\/animated(\d+)\.gif$/ ){
            ok( $image_info->{'animated'}, 'animated gif' ) ;
            is( $image_info->{'frames'}, $1, 'correct frame count' );
        }

        if ( $image =~ m/^${dir}\/images\/not_animated.gif$/ ){
            ok( !$image_info->{'animated'}, 'not animated gif' ) ;
            is( $image_info->{'frames'}, 1, 'correct frame count' );
        }
    }
}

foreach my $fake ( @{$filelist->{'fakes'}} ){
    my $image_info = $validator->validate( $fake );
    is( $image_info, undef, "image_type is undef" );
}

done_testing();
