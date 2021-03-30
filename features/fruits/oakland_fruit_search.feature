Feature: Oakland_Fruit_Search Functionality

  Background:
    Given user is on fruit search page

  Scenario: verify the user can search for the given fruit
    When user search for the fruit Rose
    Then user should see the results related to Rose
    And verify the search result is not more than 10
  # Scenario name should be the same - it will run multiple times because of duplication

  Scenario Outline: verify the user can search for different fruits
    When user search for the fruit <fruit_name>
    Then user should see the results related to <fruit_name>
    And verify the search result is not more than <no_of_items>
    Examples:
      | fruit_name | no_of_items |
      | Rose       | 10          |
      | Sunflower  | 10          |

  Scenario Outline: verify the user can search for different fruit with details
    When user search for the fruit <fruit_name>
    Then user should see the results related to <fruit_name>
    And verify the search result is not more than <no_of_items>
    And verify the header details of the fruit
      | fruit_details |
      | fruit Type    |
      | fruit Height  |
      | Flower Height |
      | Spread        |
      | Sunlight      |

    Examples:
      | fruit_name | no_of_items |
      | Rose       | 10          |
      | Sunflower  | 10          |

  Scenario: verify the user can add the fruits to the wishlist
    When user search for the fruit Rose
    And user add the first result to the wishlist
    Then verify the added fruit is showing in wishlist page
    #Then verify the Chater's Double Rose Pink Hollyhock fruit is showing in wishlist page

  Scenario: verify user can modify the item quantity in the wishlist
    When  user search for the fruit Rose
    And user add the first result to the wishlist
    And user modifies the quantity of the wishlist item
    Then verify user can see updated quantity

  # Imperative Style
  Scenario: verify user can modify the item quantity in the wishlist using imperative style
    Then user can modify the quantity in the wishlist

  Scenario: verify the user can empty the wishlist
    When user adds the fruit Rose to the wishlist
    And user empty the wishlist
    Then the user should see the confirmation message "Your Wish List is currently empty!"

  Scenario: get the fruit search details : fruit type,fruit height,Flower height,Spread,Sunlight
    When user search for the fruit Rose
    Then user should see the results related to Rose
    And get the details of the fruit

  Scenario: verify the fruit search details : fruit type,fruit height,Flower height,Spread,Sunlight are correct
    When user search for the fruit Rose
    Then user should see the results related to Rose
    And verify the details of the fruit
      | fruit_details | fruit_values |
      | fruit Type    | perennial    |
      | fruit Height  | 4 feet       |
      | Flower Height | 6 feet       |
      | Spread        | 24 inches    |
      | Sunlight      | full sun     |

  @jira2345
  Scenario: testing new functionality for fruits
    Given fdafsaf
    When fdafdff
    Then fdsafds


  @jira2345
  Scenario: testing new functionality for fruits - negative case
    Given fdafsaf
    When fdafdff
    Then fdsafds
    And fdsafdsfadsf