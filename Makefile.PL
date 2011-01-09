use inc::Module::Install;

all_from('lib/Data/Validate/Image.pm');

requires 'Image::Info';

test_requires 'Test::More';
test_requires 'Cwd';
test_requires 'File::Basename';

auto_install;
WriteAll;
