class CreateCampaignQuotas < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_quotas do |t|
      t.integer :tap_id
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
