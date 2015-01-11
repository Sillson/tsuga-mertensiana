class HomeController < ApplicationController
  require 'gc_fetch/gc_fetch'

  def index
    @api = GatherContentApi.new(ENV["ORGANIZATION"], ENV["API_KEY"], 'x')
    @mash = Hashie::Mash.new(@api.get_projects)
    @mash.shift
  end
end
