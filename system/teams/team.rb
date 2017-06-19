module Teams
  class Team < Domain::Team
    def serialize
      { name: @name }
    end
  end
end
