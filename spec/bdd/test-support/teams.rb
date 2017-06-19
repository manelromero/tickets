module Page
  class Teams
    include Capybara::DSL

    def initialize
      url = '/teams'
      visit(url)
      validate!
    end

    def add_team(name)
      fill('team-name', name)
      click('[name=submit]')
    end

    def team?(name)
      has_content?(name)
    end

    def empty_input?
      input_value = find('[name=team-name]').value
      input_value == ''
    end

    def fill(field, value)
      fill_in(field, with: value)
    end

    def click(target)
      find(target).click
    end

    private

    def validate!
      assert_selector('#formulary')
    end
  end
end
