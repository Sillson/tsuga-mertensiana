module ApplicationHelper
  def clean_ampersands(name)
    name.gsub! /\b&amp;\b/, "&"
  end
end
