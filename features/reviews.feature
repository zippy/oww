Feature: Review
  As a user
  I want to review submissions
  So that I become a better writer

    Background:
        Given a shop "OWW" with 4 points to submit
        And a logged in user in the default shop
        And a submission titled "My Submission"
    
    Scenario: User reviews a submission and earns points, and sees review count increase
        When I go to the dashboard page
        Then I should see "Review points: 0" within ".my_points"
        Then I should see "0" within ".my_review_count"
        When I go to the submission page for "My Submission"
        And I follow "Review"
        Then I should be taken to the new review page for "My Submission"
        When I fill in "Review" with "This is the content of my review"
        And I press "Save"
        Then I should be taken to the reviews page for "My Submission"
        And I should see "joe"
        When I go to the dashboard page
        Then I should see "Review points: 4" within ".my_points"
        When I go to the dashboard page
        Then I should see "1" within ".my_review_count"
    
        @pending
    Scenario: User's review is rejected because it's too short
    @pending
    Scenario: User tries and fails to review their own submissions
    @pending
    Scenario: Lifetime reviews vs. reviews count and review archiving.
