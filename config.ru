#\ -p 8080 -o 0.0.0.0
require_relative 'ui'

if ENV['DEV']
  require_relative 'spec/mock_api/api'
  map('/api') { run API.new }
end

run UI.new
