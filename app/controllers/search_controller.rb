class SearchController < ApplicationController
  def show
    client = Taric.client(region: params[:region])
    #get the summoner ID
    begin 
      @id = client.summoners_by_names(summoner_names: params[:summonerName])[params[:summonerName].downcase.split.join]["id"]
    
    rescue Taric::FaradayMiddleware::InternalServerError, Taric::FaradayMiddleware::ServiceUnavailable, Taric::FaradayMiddleware::GatewayTimeout
      redirect_to :back, :flash => { :error => 0 } 
    rescue Taric::FaradayMiddleware::RateLimitExceeded
      redirect_to :back, :flash => { :error => 1 }
    rescue Taric::FaradayMiddleware::NotFound
      redirect_to :back, :flash => { :error => 2} 
    end
      
    #@id = 41820271
    #get the ranked match history
    @matches = client.match_history(summoner_id: @id, ranked_queues: "RANKED_SOLO_5x5")["matches"]
    
    #byebug
  end
end
