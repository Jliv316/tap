class TapService
  attr_reader :email, :auth_token
  def initialize(email)
    @auth_token = TokenGenerator.new(email).auth_token
    @email = email
  end

  def headers
    {
      authorization: "Basic #{@auth_token}",
      content_type: "application/vnd.api+json;charset=UTF-8"
    }
  end

  def campaigns
    begin
      Rails.logger.info "getting all campaigns associated with the authenticated user: #{email}"
      response = RestClient.get("#{ENV['BASE_URL']}/api/v1/campaigns", headers)
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error "Request for a list of campaigns associated with a authenticated user (#{email}) failed #{e.response}"
      raise "Get Campaigns - Request Failed"
    end
    JSON.parse(response.body).map { |campaign| campaign.symbolize_keys }
  end

  def campaign(id)
    begin
      Rails.logger.info "Retrieving campaign metadata for campaign_id: #{id}"
      response = RestClient.get("#{ENV['BASE_URL']}/api/v1/campaigns/#{id}", headers)
    rescue
      Rails.logger.error "Request for campaign with id: #{id} failed"
      raise "Get Campaign - Request Failed"
    end
    JSON.parse(response.body)
  end
end
