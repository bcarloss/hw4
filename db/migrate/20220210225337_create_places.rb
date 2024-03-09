class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:places)
      create_table :places do |t|
        t.string :name

        t.timestamps
      end
    end
  end
end
