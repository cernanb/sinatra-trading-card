class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :player
      t.string :team
      t.string :year
    end
  end
end
