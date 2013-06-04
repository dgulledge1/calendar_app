class AddUsersEmailToEvents < ActiveRecord::Migration
  def change
    change_table(:events) do |t|
      t.column :user_email, :string
    end
  end
end
