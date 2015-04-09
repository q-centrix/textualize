require 'thor'

LIB_FOLDER = File.expand_path('../../lib', __FILE__)

Dir.glob(LIB_FOLDER + '/**/*.rb').each { |file| require file }
