class Recipe
  include HTTParty
  #1f8a5aa4ec496312b377885e653bcc12
  #echo 'export FOOD2FORK_SERVER_AND_PORT=www.food2fork.com' >> ~/.bashrc
    #source ~/.bashrc
  key_value = ENV[’FOOD2FORK_KEY’]
  hostport = ENV[’FOOD2FORK_SERVER_AND_PORT’] || ’www.food2fork.com’
  base_uri "http://#{hostport}/api"

  default_params key: key_value
  format :json
  
  def self.for term
    get("/search", query: {q: term})["recipes"]
  end

end
