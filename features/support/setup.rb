Dir.glob("#{__dir__}/**/*.rb").each { |file| require file }
require 'aruba/cucumber'

Before('@increase_wait_time') do
  @aruba_timeout_seconds = 5
end
