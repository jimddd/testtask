class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.float :points
      t.integer :prize_pool
      t.integer :buy_in
      t.integer :entrants
      t.date :date

      t.timestamps
    end
  end
end
