Feature: Submissions
  As a user
  I want to post my writing
  So that people can review it

	Background: 
		Given a logged in user
		And a shop "OWW" with "4" points to submit

    Scenario: User posts writing and sees point count go down and the submission in dashboard and submissions browser.
        When I go to the submissions page
        And I follow "New Submission"
        Then I should be taken to the new submission page
        When I fill in "Title" with "My Title"
        And I select "Science Fiction" from "Genre"
        And I select "Story" from "Kind"
        And I select "Adult" from "Audience"
        And I fill in "Submission" with "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec volutpat velit id elit ultrices cursus. Nulla at quam sed est tempor porttitor et at ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla interdum euismod molestie. Vivamus nisl mi, eleifend a dapibus eu, fringilla quis arcu. Suspendisse iaculis volutpat purus eu aliquam. In dictum vehicula fermentum. Phasellus dictum, nibh id elementum blandit, velit tortor faucibus sapien, in molestie erat velit at orci. In hac habitasse platea dictumst. Vivamus quis elit leo. Nam varius diam et velit scelerisque tempus."
        And I press "Post Submission"
        Then I should be taken to the submission page for "My Title"
        And I should see "Lorem ipsum dolor"
        When I go to the submissions page
        Then I should see "My Title"
        When I go to the dashboard page
        Then I should see "My Title" within ".my_submissions"

    Scenario: User updates writing
    Scenario: User tries to post writing without filling in required fields
    Scenario: User tries to posts writing with insufficient points, and can't
    Scenario: User tries to posts writing with insufficient posts, and can't but sees rules summary
    Scenario: Submission archiving?
