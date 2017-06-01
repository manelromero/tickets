require_relative 'team'
require_relative 'repository'

module Teams
  class Service
    class << self
      def add(name)
        team = Teams::Team.new(name)
        team_added = Teams::Repository.add(team)
        team_added.serialize
      end
    end
  end
end
