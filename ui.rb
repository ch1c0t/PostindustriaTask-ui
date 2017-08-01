require 'hobby'
require 'slim'

require 'foundation/scss/in/sass_path'

class Page
  def initialize path
    @template = Slim::Template.new path
  end

  def css_tag
    sass_string = IO.read 'css/main.sass'
    css_string = Sass::Engine.new(sass_string, load_paths: ['css']).render
    "<style>#{css_string}</style>"
  end

  def js_tag
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
