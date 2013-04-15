class RenameTypeColumnToLftypeFromLfitem < ActiveRecord::Migration
  def change
  	rename_column :lfitems, :type, :lftype
  end
end
