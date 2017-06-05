require 'mongo'

module Teams
  class Repository
    URI = ENV['MONGODB_URI']

    class << self
      def add(team)
        return if exists?(team.name)
        collection.insert_one(team.serialize)
        team
      end

      def list
        teams = collection.find
        teams.map { |team_data| Teams::Team.from_bson(team_data) }
      end

      def retrieve(name)
        team = collection.find({ name: name }).first
        Teams::Team.from_bson(team)
      end

      private

      def connection
        @connection ||= Mongo::Client.new(URI)
      end

      def collection
        connection[:teams]
      end

      def exists?(name)
        collection.find({ name: name }).first
      end
    end
  end
end
