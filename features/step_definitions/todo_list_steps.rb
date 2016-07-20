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

Then(/^I should see a list of todos$/) do
  wait_for_table
end