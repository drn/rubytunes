require 'rubytunes/base'

class RubyTunes
  class Item < Base

    class << self

      def all
        # TODO
      end

      def random; new(reference: "some #{type}") end

      def type; name.gsub('RubyTunes::','').downcase end

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

    def id; property 'persistent id' end
    def name; property 'name' end
    def type; self.class.type end

  private

    def raise_if_superclass
      if self.class == RubyTunes::Item
        raise 'Only subclasses of RubyTunes::Item can be instantiated'
      end
    end

    def property(property); run "#{property} of #{reference}" end

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
