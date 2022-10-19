class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.string :date
      t.integer :band_id
      t.integer :venue_id
    end
  end
end
