module Teams
  class Team
    attr_reader :name
    def initialize(name)
      @name = name
    end

    def serialize
      { name: name }
    end
  end
end
