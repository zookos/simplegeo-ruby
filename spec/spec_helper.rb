$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'simple_geo'
require 'rspec'
require 'fakeweb'
require 'vcr'

Rspec.configure do |config|

  config.extend VCR::RSpec::Macros

  VCR.config do |c|
    c.cassette_library_dir = 'vcr/cassettes'
    c.stub_with :fakeweb
  end

end


def fixture_file(filename)
  file_path = File.expand_path(File.dirname(__FILE__) + "/fixtures/" + filename)
  File.read(file_path)
end

def stub_request(method, url, options={})
  options[:body] = fixture_file(options.delete(:fixture_file)) if options[:fixture_file]
  options[:content_type] = 'application/json'

  FakeWeb.register_uri(method, url, options)
end
