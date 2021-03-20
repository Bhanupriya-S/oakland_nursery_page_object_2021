require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new $browser_type
end

Before do @special_test


end

After do
  @browser.close
end

  # After do #(THIS executes from last to first)
  #Cleanup the data
  # end