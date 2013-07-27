use inc::Module::Install;

all_from('lib/Data/Validate/Image.pm');

requires 'Image::Info';

test_requires 'Test::More';
test_requires 'Cwd';
test_requires 'File::Basename';

resources(
    'license'     => 'http://dev.perl.org/licenses/',
    'repository'  => 'https://github.com/thisaintnews/data-validate-image.git',
);

auto_install;
WriteAll;
