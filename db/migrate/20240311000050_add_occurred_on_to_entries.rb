class AddOccurredOnToEntries < ActiveRecord::Migration[7.0]
  def change
    unless column_exists? :entries, :occurred_on
      add_column :entries, :occurred_on, :date
    end
  end
end

