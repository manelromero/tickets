require 'mongo'

module Teams
  class Repository
    URI = ENV['MONGODB_URI']

    class << self
      def add(team)
        collection.insert_one(team.serialize)
        team
      end

      def list
        teams = collection.find
        teams.map { |team_data| Teams::Team.from_bson(team_data) }
      end

      private

      def connection
        @connection ||= Mongo::Client.new(URI)
      end

      def collection
        connection[:teams]
      end
    end
  end
end
