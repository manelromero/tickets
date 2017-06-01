module Page
  class Teams
    include Capybara::DSL

    def initialize
      url ='/teams'
      visit(url)
      validate!
    end

    private

    def validate!
      assert_selector('#teams')
    end
  end
end
