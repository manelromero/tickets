require_relative '../../system/teams/service'
require_relative '../../system/teams/repository'

describe Teams::Service do
  before(:each) { TestRepository.flush }

  it 'retrieves a team' do
    team = add_team('Some team')
    expect(team[:name]).to eq('Some team')
  end

  it 'retrieves all teams' do
    add_team('Some team')
    result = Teams::Service.list
    expect(result.any?).to be true
  end
end

class TestRepository < Teams::Repository
  def self.flush
    collection.delete_many
  end
end

def add_team(name)
  team_data = { 'name' => name }
  Teams::Service.add(team_data)
end
