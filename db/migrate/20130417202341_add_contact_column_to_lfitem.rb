class AddContactColumnToLfitem < ActiveRecord::Migration
  def change
    add_column :lfitems, :contact, :string
  end
end
