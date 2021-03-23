require 'rspec'
require 'page-object'
require 'data_magic'

World(PageObject::PageFactory) # in page object frame work - we used pagefactory module and this is globally available across the method.

# oakland_test = 'www.oaklandtest.com'
# oakland_int = 'www.oaklandint.com'
# oakland_qa = 'www.oaklandqa.com'

if ENV['environment'].nil?
  env = 'qa'
end
# $app_url = "https://plants.oaklandnursery#{$env}.com/12130001"
$app_url = "https://plants.oaklandnursery.com/12130001"

if ENV['browser_type'].nil?
  $browser_type = :chrome
end

$file_path = 'features/support/test data/test_data.yml'
$test_data = YAML.load_file $file_path
