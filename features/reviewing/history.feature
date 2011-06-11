Feature: Reviewer History
  As a user
  I want my reviewer history to be saved
  So that I can look at it, and also see the reviewer history of other workshopers

    Background:
        Given a shop "OWW" with 4 points to submit
        And a logged in user in the default shop
        And a submission titled "My Submission"
    
    Scenario: User views own reviewer history from dashboard
        When I go to the new review page for "My Submission"
        And I fill in "Review" with "This is the content of my review"
        And I press "Save"
        When I go to the dashboard page
        And I follow "Your reviewer history"
        Then I should be taken to the reviewer history page for "joe"
        And I should see "Number of reviews currently online: 1"
        And I should see "My Submission by joe" within "#reviewer_history"

        @pending
    Scenario: User goes to a user's reviewer history from the Directory
        
        