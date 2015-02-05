class HomeController < ApplicationController
  require 'gc_fetch/gc_fetch'

  def index
    @@api = GatherContentApi.new(ENV["ORGANIZATION"], ENV["API_KEY"], 'x')
    mash = Hashie::Mash.new(@@api.get_projects)
    mash.shift #Can append .shift to api call in console, won't run on server.
    clean_mash = mash.projects.each {|clean| clean_ampersands(clean.name)}
    @user_projects = clean_mash.sort_by {|project| project.name}
  end

  def project_overview
    @project_id_number = params[:id]
    @project_name = params[:name]
    mash = Hashie::Mash.new(@@api.get_pages_by_project(@project_id_number))
    mash.shift
    @page_array = mash.first.drop(1).flatten!
    @nested_page_array = create_hash(@page_array)
  end

  def project_download
    @project_id_number = params[:id]
    @project_name = params[:name]
  end
end
