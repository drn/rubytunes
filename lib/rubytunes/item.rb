require 'rubytunes/property'
require 'rubytunes/script'

class RubyTunes
  class Item

    class << self

      def properties
        {
          id:   Property.new(name: 'persistent id', type: :string),
          name: Property.new(name: 'name',          type: :string)
        }
      end

      def define_properties
        self.properties.each do |name, property|
          self.instance_eval do
            define_method(name) { send(property.type, property.name) }
          end
        end
      end

      def find_by_id(id); new(id: id) end
      alias_method :find, :find_by_id
      def find_by_reference(reference); new(reference: reference) end
      def find_by_name(name); new(name: name) end

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
    def initialize(params={})
      @params = params
      raise_if_superclass
    end

    def type; self.class.type end

    def properties
      @properties ||= (
        raw = {}
        Script.run("get properties of #{reference}").split(', ').each do |property|
          key, value = property.split(':',2)
          raw[key] = value
        end
        properties = {}
        self.class.properties.each do |key, value|
          properties[key] = raw[value.name]
        end
        properties[:id] = self.id
        properties
      )
    end

  private

    def raise_if_superclass
      if self.class == RubyTunes::Item
        raise 'Only subclasses of RubyTunes::Item can be instantiated'
      end
    end

    def value(property); Script.run "#{property} of #{reference}" end
    alias_method :string, :value
    def integer(property); value(property).to_i end
    def float(property); value(property).to_f end
    def datetime(property); parse_datetime(value(property)) end


    def reference
      @reference ||= (by_id || by_name || by_reference)
    end

    def by_id
      @params[:id] && "some #{type} whose persistent id is \"#{@params[:id]}\""
    end

    def by_name
      @params[:name] && "#{type} \"#{@params[:name]}\""
    end

    def by_reference
      @params[:reference] || "current #{type}"
    end

  end
end
