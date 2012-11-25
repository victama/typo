Feature: Merge Articles
  As a blog administrator
  In order to tidy up my articles
  I want to be able to merge two into one

  Background:
    Given the blog is set up
    And the following articles exist:
  | title              | author  | body                                                  |
  | How to lose weigth | Tolkien | Stop eating and start exercising!                     |
  | Diets and more     | Rowling | It was a joke, do not stop eating, but eat healthy :) |

  Scenario: A non-admin cannot merge two articles
    Given I am logged into the publisher panel
    And I am on the edit "How to lose weigth" article page
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And I am on the edit "How to lose weigth" article page
    Then I should see "Merge Articles"
    When I fill in "merge_with" with the id of the "Diets and more" article
    And press "Merge"
    Then I should be on the edit "How to lose weigth" article page
    And I should see "Stop eating and start exercising!"
    And I should see "It was a joke, do not stop eating, but eat healthy :)"
    And the article "Diets and more" should no longer exist

