require_relative '../domain/team'
require_relative 'team'
require_relative 'repository'

module Teams
  class Service
    class << self
      def add(name)
        team = Teams::Team.new(name)
        team_added = Teams::Repository.add(team)
        team_added.serialize
      rescue
        { success: false }
      end

      def list
        teams = Teams::Repository.list
        teams.map(&:serialize)
      end

      def retrieve(name)
        team = Teams::Repository.retrieve(name)
        team.serialize
      end
    end
  end
end
