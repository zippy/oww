Feature: Navigation
  As a user
  I want be able to navigate the site
  So that I know where I am and I know where I can go

    Background: 
      Given a logged in user

    Scenario: User navigates through all menu items
      When I follow "Submissions" within ".hmenu"
      Then I should be taken to the submissions page
      And I should see "Submissions" as the current menu item
      And I should not see "Dashboard" as the current menu item
      When I follow "Dashboard" within ".hmenu"
      Then I should be taken to the dashboard page
      And I should see "Dashboard" as the current menu item
      And I should not see "Submissions" as the current menu item
