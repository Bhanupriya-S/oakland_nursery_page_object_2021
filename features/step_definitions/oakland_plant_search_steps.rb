Given(/^user is on plant search page$/) do
  visit OakPlantSearchPage
end

When(/^user search for the plant (.+)$/) do |plant_name|
  on(OakPlantSearchPage).search_plant plant_name
end

Then(/^user should see the results related to (.+)$/) do |plant_name|
  on(OakPlantSearchPage).verify_plant_search_is_correct plant_name
end

And(/^verify the search result is not more than (\d+)$/) do |max_results|
  on(OakPlantSearchPage).verify_no_of_plant_search_results max_results
end

And(/^user add the first result to the wishlist$/) do
  @first_plant_name = on(OakPlantSearchPage).get_all_plant_names.first
  on(OakPlantSearchPage).add_plant_to_wishlist
end

Then(/^verify the added plant is showing in wishlist page$/) do
  on(OakPlantSearchPage).verify_wishlist_has_plant @first_plant_name
end

And(/^user modifies the quantity of the wishlist item$/) do
  on(OakWishListPage).update_wishlist_quantity 3
end

Then(/^verify user can see updated quantity$/) do
  on(OakWishListPage).verify_wishlist_quantity_has_updated 3
end

When(/^user adds the plant (.*) to the wishlist$/) do |plant_name|
  on(OakPlantSearchPage).search_plant plant_name
  @first_plant_name = on(OakPlantSearchPage).get_all_plant_names.first
  on(OakPlantSearchPage).add_plant_to_wishlist
  on(OakPlantSearchPage).verify_wishlist_has_plant @first_plant_name
end

And(/^user empty the wishlist$/) do
  on(OakWishListPage).empty_wishlist
end

Then(/^the user should see the confirmation message "([^"]*)"$/) do |message|
  on(OakErrorPage).verify_wishlist_empty_message_displayed message
end

And(/^get the details of the plant$/) do
  p on(OakPlantSearchPage).get_plant_info
end

And(/^verify the details of the plant$/) do |table|
  # table is a table.hashes.keys # => [:plant_details, :plant_values]
  actual_plant_details = on(OakPlantSearchPage).get_plant_info
  expected_plant_details = {}
  table.hashes.each do |each_plant|
    expected_plant_details[ each_plant['plant_details']] = each_plant['plant_values']
  end
  p "Expected Plant Details : #{expected_plant_details}"
  p "Actual Plant Details : #{actual_plant_details}"
  # fail "#{expected_plant_details} is NOT same as #{actual_plant_details}" unless expected_plant_details == actual_plant_details
  expect(expected_plant_details.sort).should.eql?(actual_plant_details)
end

And(/^verify the header details of the plant$/) do |table|
  # table is a table.hashes.keys # => [:plant_details]
  actual_plant_details = on(OakPlantSearchPage).get_plant_info
  expected_plant_details = {}
  table.hashes.each do |each_plant|
    header_found = false # why header value is false here?, you meant the first header?
    actual_plant_details.each_key do |each_header|
      if each_header.include? each_plant['plant_details']
        header_found = true
        break
        # p each_plant['plant details']
      end
    end
    # fail "The Header #{each_plant['plant_details']} NOT Found" unless each_header = true
    if header_found != true
      fail "The Header #{each_plant['plant_details']} NOT Found"
    end
  end
end

Then(/^user can modify the quantity in the wishlist$/) do
  # on(OakPlantSearchPage) do |page|
  #   page.search_plant 'Rose'
  #   @first_plant_name = page.get_all_plant_names.first
  #   page.add_plant_to_wishlist
  # end
  #
  # on(OakWishListPage) do |page|
  #   page.update_wishlist_quantity 3
  #   page.verify_wishlist_quantity_has_updated 3
  # end

  # plant_name = 'Rose'
  # "step 'user search for the plant #{plant_name}"
  # step 'user add the first result to the wishlist'
  # step 'user modifies the quantity of the wishlist item'
  # step 'verify user can see updated quantity'

  steps %Q{
    When  user search for the plant Rose
    And user add the first result to the wishlist
    And user modifies the quantity of the wishlist item
    Then verify user can see updated quantity
  }
end

When(/^user verifies data can be read from yml file$/) do
  # file_path = 'features/support/test data/test_data.yml'
  # test_data = YAML.load_file 'features/support/test data/test_data.yml'
  # # Moved the above code in "env.rb" for loading the file by default
  p 'Orginal data from Yaml file:'
  p $test_data['language_name']
  p $test_data['chase']['id']
  p 'Data modification :'
  p $test_data['chase']['name'] = 'java'
  p $test_data['chase']['id'] = '64617'
  p 'File Concept for rewriting'
  File.open($file_path, 'w') { |each_value|

    $test_data['chase']['id'] = 47272
    each_value.write($test_data.to_yaml)
  }
  p $test_data['chase']['id']
end

And(/^verify the details of (.*) are correct$/) do |plant_name|
  p $test_data[plant_name]['Plant Type']
  actual_plant_details = on(OakPlantSearchPage).get_plant_info
  expected_plant_details = $test_data[plant_name]
  expect(expected_plant_details.sort).should.eql? actual_plant_details.sort
end

