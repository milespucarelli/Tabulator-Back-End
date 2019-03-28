class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.integer :str
      t.string :fret
      t.integer :note_id

      t.timestamps
    end
  end
end
