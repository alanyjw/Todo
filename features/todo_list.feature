Feature: Todo List

Background:
  Given I see a list of todos

Scenario: Adding a todo item
  When I add a todo item to "Buy milk"
  Then I should see "Buy milk" added to list

Scenario: Stop adding todo
  When I press "Add"
  And I press "Cancel"
  Then I see a list of todos

Scenario: Showing a todo item
  When I add a todo item to "Buy milk"
  And I should be able to edit "Buy milk" to "Buy cereal"
  Then I should see "Buy cereal" added to list