class CampaignsController < ApplicationController
  def ordered_campaigns
    tap_service = TapService.new("codetest@tap.com")
    campaigns = tap_service.campaigns
    Campaign.write_new_campaigns(campaigns)
    Campaign.all.each do |campaign| 
      campaign_data = tap_service.campaign(campaign.tap_id)
      quotas = campaign_data["campaign_quotas"].map { |v| v.symbolize_keys }
      quotas.each do |q|
        require'pry';binding.pry
        # campaign.campaign_quotas.create(tap_id: q[:id])
      end
      require'pry';binding.pry
    end
  end
end