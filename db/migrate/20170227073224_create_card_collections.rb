class CreateCardCollections < ActiveRecord::Migration
  def change
    create_table :card_collections do |t|
      t.integer :user_id
      t.integer :card_id
      t.string :quality
      t.boolean :private, default: false
    end
  end
end
