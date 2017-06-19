require_relative '../../system/teams/service'
require_relative '../../system/teams/repository'

describe Teams::Service do
  before(:each) { Teams::Repository.flush }

  it 'retrieves a team' do
    team = Teams::Service.add('Some team')
    expect(team[:name]).to eq('Some team')
  end

  it 'retrieves all teams' do
    Teams::Service.add('Some team')

    result = Teams::Service.list
    expect(result.any?).to be true
  end
end
