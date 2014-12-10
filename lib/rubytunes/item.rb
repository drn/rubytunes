require 'rubytunes/base'
require 'rubytunes/property'

class RubyTunes
  class Item < Base

    def self.properties
      {
        id:   Property.new(name: 'persistent id', type: :string),
        name: Property.new(name: 'name',          type: :string)
      }
    end

    def self.define_properties
      self.properties.each do |name, property|
        self.instance_eval do
          define_method(name) { send(property.type, property.name) }
        end
      end
    end

    class << self

      def all
        # TODO
      end

      def random; new(reference: "some #{type}") end

      def type; name.gsub('RubyTunes::','').downcase end

    private

    end

    # @param info [Hash] (optional)
    #   {
    #     id:         String, (optional)
    #     name:       String, (optional)
    #     reference:  String  (optional)
    #   }
    def initialize(info={})
      @info = info
      raise_if_superclass
    end

    def type; self.class.type end

  private

    def raise_if_superclass
      if self.class == RubyTunes::Item
        raise 'Only subclasses of RubyTunes::Item can be instantiated'
      end
    end

    def value(property); run "#{property} of #{reference}" end
    alias_method :string, :value
    def integer(property); value(property).to_i end
    def float(property); value(property).to_f end
    def datetime(property); parse_datetime(value(property)) end


    def reference
      @reference ||= (by_id || by_name || by_reference)
    end

    def by_id
      @info[:id] && "some #{type} whose persistent id is \"#{@info[:id]}\""
    end

    def by_name
      @info[:name] && "some #{type} whose name is \"#{@info[:name]}\""
    end

    def by_reference
      @info[:reference] || "current #{type}"
    end

  end
end
