# db/migrate/[timestamp]_create_entries.rb
class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :description
      t.references :place, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end


