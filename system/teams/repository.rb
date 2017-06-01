module Teams
  class Repository
    @content = []

    class << self
      def add(team)
        @content << team
        team
      end
    end
  end
end
