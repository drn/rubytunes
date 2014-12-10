class RubyTunes
  class Property

    attr_accessor :name, :type

    def initialize(info)
      self.name = info[:name]
      self.type = info[:type]
    end

  end
end
