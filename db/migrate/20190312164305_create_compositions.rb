class CreateCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :compositions do |t|
      t.string :title
      t.string :artist
      t.integer :user_id

      t.timestamps
    end
  end
end
