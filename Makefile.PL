use inc::Module::Install;

all_from('lib/Data/Validate/Image.pm');

requires 'Image::Info';

test_requires 'Test::More';
test_requires 'Cwd';
test_requires 'File::Basename';

perl_version '5.008';

resources(
    'repository'  => 'https://github.com/n0body-/data-validate-image.git',
);

auto_install;
WriteAll;
