module Teams
  class Fixture
    extend Capybara::DSL

    class << self
      def initial
        Page::Teams.new
      end

      def form_filled(team_name)
        current = initial
        current.fill('team-name', team_name)
        current
      end

      def one_team_added(name)
        current = initial
        current.add_team(name)
        current
      end
    end
  end
end
