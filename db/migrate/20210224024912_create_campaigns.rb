class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.integer :tap_id, unique: true
      t.string :name
      t.integer :length_of_interview
      t.string :cpi

      t.timestamps
    end
  end
end
