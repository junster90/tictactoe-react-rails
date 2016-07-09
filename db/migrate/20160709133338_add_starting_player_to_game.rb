class AddStartingPlayerToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :player_1, :string
  end
end
