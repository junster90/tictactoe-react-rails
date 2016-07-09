class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :computer
      t.string :player

      t.timestamps null: false
    end
  end
end
