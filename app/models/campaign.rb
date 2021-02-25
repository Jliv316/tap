class Campaign < ApplicationRecord
  has_many :campaign_quotas
  validates_uniqueness_of :tap_id

  def self.write_new_campaigns(campaigns)
    campaigns = find_new_campaigns(campaigns)
    if !campaigns.empty?
      campaigns.map! do |campaign|
        Campaign.new(tap_id: campaign[:id], 
                    name: campaign[:name],
                    length_of_interview: campaign[:length_of_interview],
                    cpi: campaign[:cpi]) 
      end
      Campaign.import campaigns, validate: true
    end
  end

  def self.find_new_campaigns(campaigns)
    last_saved_campaign_id = self.last&.tap_id || 0
    new_campaigns = campaigns.find_all do |campaign|
      campaign[:id] > last_saved_campaign_id
    end
  end
end