require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'cookstyle'
require 'foodcritic'

# Style tests. Cookstyle & Foodcritic
namespace :style do
  desc 'Run Cookstyle lint checks'
  RuboCop::RakeTask.new do |task|
    task.options << '--display-cop-names'
  end

  desc 'Run Foodcritic checks'
  FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
    t.options = {
      fail_tags: ['any'],
      tags: [],
    }
  end
end

# Rspec and ChefSpec
desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:chefspec)

task default: %w(style:rubocop style:foodcritic chefspec)
