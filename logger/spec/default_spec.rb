require_relative 'spec_helper'

describe 'logger::default' do
  let(:runner) {
    ChefSpec::ChefRunner.new(
      platform: 'ubuntu', version: '12.04'
    ).converge('logger::default')
  }

  it 'writes the node object to a file' do
    expect(runner).to create_file('/tmp/logfile.txt')
  end

end
