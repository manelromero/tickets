module Teams
  class Repository
    @content = []

    class << self
      def add(team)
        return if exists?(team.name)
        @content << team
        team
      end

      def list
        @content
      end

      def retrieve(name)
        team_found = @content.find { |team| team.name == name }
        team_found
      end

      def flush
        @content = []
      end

      private

      def exists?(name)
        @content.find { |team| team.name == name }
      end
    end
  end
end
