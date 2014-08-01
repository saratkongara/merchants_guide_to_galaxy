require 'rake'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Run code style checker'
task :rubocop do
  system('rubocop -c rubocop.yaml')
end

desc 'Package as a Ruby Gem' 
task :gem do
  system('gem build merchants_guide_to_galaxy.gemspec')
end

task :default  => [:test, :rubocop]