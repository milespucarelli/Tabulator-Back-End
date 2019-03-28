class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :duration
      t.integer :composition_id

      t.timestamps
    end
  end
end
