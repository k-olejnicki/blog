class AddNickToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :nick, :string
  end
end
