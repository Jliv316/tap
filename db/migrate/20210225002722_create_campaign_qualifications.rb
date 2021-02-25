class CreateCampaignQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_qualifications do |t|
      t.text :pre_codes
      t.integer :question_id
      t.references :campaign_quota, foreign_key: true

      t.timestamps
    end
  end
end
