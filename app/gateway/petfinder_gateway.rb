class PetfinderGateway
  def self.petfinder_search(type, breed, zip_code)
    response = conn.get("/v2/animals") do |req|
      req.params[:type] = type
      req.params[:breed] = breed
      req.params[:location] = zip_code
    end

    JSON.parse(response.body, symbolize_names: true)

  end

  private_class_method  def self.conn
    Faraday.new(url:"https://api.petfinder.com") do |faraday|
      faraday.request :authorization, "Bearer", -> {self.auth_token}
    end
  end

  private_class_method def self.auth_token 
    Rails.cache.fetch("auth_token", expires_in: 59.minutes) do 
      conn = Faraday.new(url: "https://api.petfinder.com")
      req = conn.post "/v2/oauth2/token" do |req|
        req.headers[:content_type] = 'application/json'
        req.body = JSON.generate(
          grant_type: "client_credentials", 
          client_id: Rails.application.credentials.petfinder[:key],
          client_secret: Rails.application.credentials.petfinder[:secret]
        )
      end

      json = JSON.parse(req.body, symbolize_names: true)
      json[:access_token]

    end
  end
end