class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'FILL_IN'
      req.params['client_secret'] = 'FILL_IN'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(resp.body)
    @repository = body["items"][0]
    render 'search'
  end
end
