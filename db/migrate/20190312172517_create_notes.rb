class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :position
      t.string :duration
      t.integer :string_number
      t.integer :fret_number
      t.integer :measure_id

      t.timestamps
    end
  end
end
