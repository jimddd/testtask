class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.integer :place
      t.string :name
      t.integer :points
      t.integer :prize
      t.integer :event_id

      t.timestamps
    end
  end
end
