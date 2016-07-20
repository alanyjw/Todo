require 'pry'

WAIT_FOR_OPTIONS = {
    timeout: 4,
    timeout_message: "Timed out after waiting 4 seconds for element"
}.freeze

module Todo
  module Table
    def wait_for_table
      wait_for(WAIT_FOR_OPTIONS) do
        table_exists?
      end
    end

    def table_exists?
      not query('UITableView').empty?
    end
  end
end

World(Todo::Table)

Given(/^I see a list of todos$/) do
  wait_for_table
end

When(/^I add a todo item to "([^"]+)"$/) do |todo_name|
  touch("* marked: 'Add'")
  touch("* marked: 'Todo Name'")

  wait_for_keyboard

  keyboard_enter_text(todo_name)

  touch("* marked: 'Create'")
end


Then(/^I should see "([^"]*)" added to list$/) do |todo_name|
  addedTodo = query("tableViewCell label marked: '#{todo_name}'")
  expect(addedTodo).to be_any
end