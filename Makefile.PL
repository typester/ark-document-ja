use inc::Module::Install;

name 'Ark-Manual';
license 'perl';
version '0.01';

test_requires 'Test::More';
use_test_base;

auto_include;

WriteAll;
