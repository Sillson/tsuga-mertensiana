require 'httparty'
require 'hashie/mash'
require 'json'


class GatherContentApi
  include HTTParty
  format :json
  debug_output $stdout

  def initialize(subdomain, u, p)
    self.class.base_uri('https://' + subdomain + '.gathercontent.com/api/0.3')
    @auth = {:username => u, :password => p}
  end

  def method_missing(method, *args, &block)
    options = {:body => {'id' => args[0]}, :digest_auth => @auth}
    self.class.post('/' + method.to_s, options)
  end

  def create_hash(m)
    by_id = m.group_by(&:id)
    page_hash = m.group_by { |page| by_id[page.parent_id]}
  end
end

