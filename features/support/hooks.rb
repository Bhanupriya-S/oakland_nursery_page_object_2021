require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new $browser_type
end




After do
  @browser.close
end

After do |scenario|
  SCREENSHOTS_DIRECTORY = "html_report"
  if scenario.failed?
    #Saves screeshots to features/test_results/Screenshots directory, name is scenario name
    screenshot = "#{scenario.name.gsub(' ', '-').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(File.join(SCREENSHOTS_DIRECTORY, screenshot))
    embed(File.join(SCREENSHOTS_DIRECTORY, screenshot),"image/png","SCRRENSHOT")
  end
end