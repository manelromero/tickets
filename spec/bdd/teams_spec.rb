require 'spec_helper'
require_relative 'test-support/teams'
require_relative 'test-support/teams_fixture'

feature 'Teams page' do
  context 'form' do
    scenario 'disallows team creation without first uppercase character' do
      team_name = 'some team'
      current = Teams::Fixture.form_filled(team_name)

      expect(current.save_enabled?).to be false
    end

    scenario 'allows team creation with first uppercase character' do
      team_name = 'Some team'
      current = Teams::Fixture.form_filled(team_name)

      expect(current.save_enabled?).to be true
    end

    scenario 'empties itself when submitted' do
      team_name = 'Some team'
      current = Teams::Fixture.form_filled(team_name)
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
