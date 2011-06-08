Feature: Shops
  In order to generalize workshop functionality
  A user
  Should be able to create and configure workshops

	Background: 
		Given a logged in user

    Scenario: Creates a workshop
        When I go to the shops page
        And I follow "New Workshop"
        Then I should be taken to the new shop page
        When I fill in "Name" with "My Workshop"
        And I fill in "Points to submit" with "0"
        And I press "Create"
        Then I should be taken to the shop page for "My Workshop"
        And I should see "My Workshop"
        When I go to the shops page
        Then I should see "My Workshop"
        