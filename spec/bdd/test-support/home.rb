module Page
  class Home
    include Capybara::DSL

    def initialize
      url = '/'
      visit(url)
      validate!
    end

    private

    def validate!
      assert_selector('#home')
    end
  end
end
