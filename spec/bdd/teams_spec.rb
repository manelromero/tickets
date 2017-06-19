require 'spec_helper'
require_relative 'test-support/teams'
require_relative 'test-support/teams_fixture'

feature 'Teams page' do
  context 'form' do
    scenario 'empties itself when submitted' do
      current = Teams::Fixture.form_filled
      current.click('[name=submit]')

      expect(current.empty_input?).to be true
    end
  end

  context 'list' do
    scenario 'updates when element added' do
      team_name = 'Some team'
      current = Teams::Fixture.one_team_added(team_name)

      result = current.team?(team_name)
      expect(result).to be true
    end
  end
end
