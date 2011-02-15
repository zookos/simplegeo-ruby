require 'geojson'

module SimpleGeo
  class Record < GeoRuby::SimpleFeatures::Feature
    attr_reader :created, :layer

    def initialize(options={})
      super(options[:geometry], options[:properties], options[:id])
      @created = options[:created]
      @layer = options[:layer]
    end
  end
end
