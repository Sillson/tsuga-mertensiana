class HomeController < ApplicationController
  require 'gc_fetch/gc_fetch'

  def index
    @api = GatherContentApi.new(ENV["ORGANIZATION"], ENV["API_KEY"], 'x')
  end
end
