class HomeController < ApplicationController
  require 'gc_fetch/gc_fetch'

  def index
    @api = GatherContentApi.new(ENV["ORGANIZATION"], ENV["API_KEY"], 'x')
    mash = Hashie::Mash.new(@api.get_projects)
    mash.shift #Can append .shift to api call in console, won't run on server.
    clean_mash = mash.projects.each {|clean| clean_ampersands(clean.name)}
    @user_projects = clean_mash.sort_by {|project| project.name}
  end

  def project_overview
    @magic_number = params[:id]
  end
end
