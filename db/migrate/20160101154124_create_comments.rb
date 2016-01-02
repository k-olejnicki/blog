class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nick
      t.text :contents
      t.string :entry_id

      t.timestamps null: false
    end
  end
end
