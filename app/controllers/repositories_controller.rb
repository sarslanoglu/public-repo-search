# frozen_string_literal: true

require 'faraday'

class RepositoriesController < ApplicationController
  def index
    @response = request_api(search_params['query'], 1) if search_params['query'].present?
    if search_params['query'].present? && search_params['page'].present?
      @response = request_api(search_params['query'], search_params['page'])
    end
    if @response.present? && @response.status == 200
      @per_page = 30
      @selected_page = 1
      @total_result = JSON.parse(@response.body)['total_count']
      @total_pages = (@total_result.to_f / @per_page).ceil
      if search_params['page'].present? && search_params['page'].to_i <= @total_pages
        @selected_page = search_params['page']
      elsif search_params['page'].to_i > @total_pages
        @response = request_api(search_params['query'], 1)
      end
      @repositories = JSON.parse(@response.body)['items']
    else
      @total_result = 0
      @repositories = []
    end
  end

  private

  def search_params
    params.permit(:query,
                  :page)
  end

  def request_api(query, page)
    url = 'https://api.github.com/search/repositories'
    Faraday.get(url, { q: query, page: page })
  end
end
