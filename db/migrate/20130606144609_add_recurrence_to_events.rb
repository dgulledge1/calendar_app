class AddRecurrenceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :recurrence, :string
  end
end
