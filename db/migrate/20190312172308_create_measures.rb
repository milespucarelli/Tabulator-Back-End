class CreateMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :measures do |t|
      t.integer :tempo
      t.string :time_signature
      t.integer :position
      t.integer :track_id

      t.timestamps
    end
  end
end
