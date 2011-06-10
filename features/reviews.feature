Feature: Review
  As a user
  I want to review submissions
  So that I become a better writer

    Background:
        Given a shop "OWW" with "4" points to submit
        And a logged in user in the default shop
        And a submission titled "My Submission"
    
    Scenario: User review a submission and earns points
        When I go to the dashboard page
        Then I should see "Review points: 0" within ".my_points"
        When I go to the submission page for "My Submission"
        And I follow "Review"
        Then I should be taken to the new review page for "My Submission"
        When I fill in "Review" with "This is the content of my review"
        And I press "Save"
        Then I should be taken to the reviews page for "My Submission"
        And I should see "joe"
        When I go to the dashboard page
        Then I should see "Review points: 4" within ".my_points"
    
    Scenario: User's review is rejected because it's two short
