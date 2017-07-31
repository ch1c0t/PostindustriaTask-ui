require 'hobby'
require 'slim'

class Page
  def initialize path
    @template = Slim::Template.new path
  end

  def to_html
    @template.render self
  end
end

HTML = Page.new('index.slim').to_html

class UI
  include Hobby

  get do
    content_type :html
    HTML
  end
end
