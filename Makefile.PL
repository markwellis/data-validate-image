use inc::Module::Install;

all_from('lib/Data/Validate/Image.pm');

requires 'Image::Info';

test_requires 'Test::More' => '0.94';
test_requires 'Cwd';
test_requires 'File::Basename';

perl_version '5.008';

resources(
    'bugtracker'  => 'https://github.com/n0body-/data-validate-image/issues',
    'repository'  => 'https://github.com/n0body-/data-validate-image.git',
);

auto_install;
WriteAll;
