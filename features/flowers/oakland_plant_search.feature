Feature: Oakland_Plant_Search Functionality

  Background:
    Given user is on plant search page

  Scenario: verify the user can search for the given plant
    When user search for the plant Rose
    Then user should see the results related to Rose
    And verify the search result is not more than 10
  # Scenario name should be the same - it will run multiple times because of duplication

  Scenario Outline: verify the user can search for different plants
    When user search for the plant <plant_name>
    Then user should see the results related to <plant_name>
    And verify the search result is not more than <no_of_items>
    Examples:
      | plant_name | no_of_items |
      | Rose       | 10          |
      | Sunflower  | 10          |

  Scenario Outline: verify the user can search for different plant with details
    When user search for the plant <plant_name>
    Then user should see the results related to <plant_name>
    And verify the search result is not more than <no_of_items>
    And verify the header details of the plant
      | plant_details |
      | Plant Type    |
      | Plant Height  |
      | Flower Height |
      | Spread        |
      | Sunlight      |

    Examples:
      | plant_name | no_of_items |
      | Rose       | 10          |
      | Sunflower  | 10          |

  Scenario: verify the user can add the plants to the wishlist
    When user search for the plant Rose
    And user add the first result to the wishlist
    Then verify the added plant is showing in wishlist page
    #Then verify the Chater's Double Rose Pink Hollyhock plant is showing in wishlist page

  Scenario: verify user can modify the item quantity in the wishlist
    When  user search for the plant Rose
    And user add the first result to the wishlist
    And user modifies the quantity of the wishlist item
    Then verify user can see updated quantity

  # Imperative Style
  Scenario: verify user can modify the item quantity in the wishlist using imperative style
    Then user can modify the quantity in the wishlist

  Scenario: verify the user can empty the wishlist
    When user adds the plant Rose to the wishlist
    And user empty the wishlist
    Then the user should see the confirmation message "Your Wish List is currently empty!"

  Scenario: get the plant search details : Plant type,Plant height,Flower height,Spread,Sunlight
    When user search for the plant Rose
    Then user should see the results related to Rose
    And get the details of the plant

  Scenario: verify the plant search details : Plant type,Plant height,Flower height,Spread,Sunlight are correct
    When user search for the plant Rose
    Then user should see the results related to Rose
    And verify the details of the plant
      | plant_details | plant_values |
      | Plant Type    | perennial    |
      | Plant Height  | 4 feet       |
      | Flower Height | 6 feet       |
      | Spread        | 24 inches    |
      | Sunlight      | full sun     |