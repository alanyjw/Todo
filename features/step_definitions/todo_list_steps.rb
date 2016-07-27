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

  touch("* marked: 'Save'")
end


Then(/^I should see "([^"]*)" added to list$/) do |todo_name|
  wait_for_element_exists("tableViewCell label marked: '#{todo_name}'")
  addedTodo = query("tableViewCell label marked: '#{todo_name}'")
  expect(addedTodo).to be_any
end

And(/^I should be able to edit "([^"]*)" to "([^"]*)"$/) do |old_todo_name, new_todo_name|
  touch("tableViewCell label marked: '#{old_todo_name}'")

  # check for title in navigation bar
  all_items = query("navigationItemView marked: '#{old_todo_name}'")
  button_items = query('navigationItemButtonView')
  non_button_items = all_items.delete_if { |item| button_items.include?(item) }
  expect(non_button_items).not_to be_empty

  wait_tap("* marked: 'Todo Name'")

  wait_for_keyboard

  # change the name of todo
  clear_text("textField marked: 'Todo Name'")
  keyboard_enter_text(new_todo_name)

  # save
  touch("* marked: 'Save'")
end