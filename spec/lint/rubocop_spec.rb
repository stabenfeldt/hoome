require 'spec_helper'

# Compares the files that has been changed between this branch and master.
describe 'Rubocop checks that the files we have changed have correct syntax' do
  before do
    current_sha = `git rev-parse --verify HEAD`.strip!
    token = ENV['GITHUB_TOKEN']
    url = 'https://api.github.com/repos/orwapp/orwapp/compare/' \
          "master...#{current_sha}?access_token=#{token}"
    puts "URL is #{url}"
    if ENV['CI']
      # The master branch is not available on the build server.
      # Query api.github.com instead.
      files = `curl -i #{url} | grep filename | cut -f2 -d: | grep \.rb | tr '"', '\ '`
    else
      files = `git diff master #{current_sha} --name-only | grep .rb`
    end
    files.tr!("\n", ' ')
    files.gsub!('db/schema.rb', '')
    files.gsub!('Gemfile', '')
    files.gsub!('Gemfile.lock', '')
    cleaned = remove_missing_files(files)
    puts "Will inspect #{cleaned}"
    @report = ''
    @report = `rubocop #{cleaned}` if cleaned.present?
    puts "Rubocop report: #{@report}"
  end

  it { expect(@report.match('Offenses')).to be_falsey }

  def remove_missing_files(files)
    cleaned = []
    files.split.each do |file|
      next              unless File.exist? file
      cleaned << file
    end
    cleaned.join(' ')
  end
end
