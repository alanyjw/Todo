Feature: Todo List

Background:
  Given I see a list of todos

Scenario: Adding a todo item
  When I add a todo item to "Buy milk"
  Then I should see "Buy milk" added to list
