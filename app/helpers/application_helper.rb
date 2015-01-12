module ApplicationHelper
  
  def clean_ampersands(name)
    name.gsub! /\b&amp;\b/, "&"
  end

  def create_hash(m)
    by_id = m.group_by(&:id)
    page_hash = m.group_by { |page| by_id[page.parent_id]}
  end
end
