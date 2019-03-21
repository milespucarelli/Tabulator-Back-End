class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :instrument_id
      t.integer :composition_id

      t.timestamps
    end
  end
end
