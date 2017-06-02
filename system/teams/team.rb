module Teams
  class Team < Domain::Team
    class << self
      def from_bson(data)
        Teams::Team.new(data['name'])
      end

      alias_method :from_json, :from_bson
    end

    def serialize
      { name: @name }
    end
  end
end
