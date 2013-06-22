SANDBOX_PATH = File.join(File.dirname(__FILE__), %w(tmp cookbooks cookbook ))

namespace :test do
  desc "Runs knife cookbook test"
  task :knife do
    Rake::Task['test:prepare_sandbox'].execute

    sh "bundle exec knife cookbook test cookbook -c test/chef/knife.rb -o #{SANDBOX_PATH}/../"
  end

  desc "Runs Chefspec tests"
  task :chefspec do
    sh "bundle exec rspec spec/"
  end

  desc "Runs Foodcritic tests"
  task :foodcritic do
    sh "bundle exec foodcritic --epic-fail any ."
  end

  desc "Runs all tests"
  task :all do
    puts "==== Running all tests"

    %w{ knife chefspec foodcritic }.each do |task|
      Rake::Task["test:#{task}"].execute
    end
  end

  desc "Creates a sandbox directory for testing"
  task :prepare_sandbox do
    files = %w{*.md *.rb attributes definitions libraries files providers recipes resources templates}

    rm_rf SANDBOX_PATH
    mkdir_p SANDBOX_PATH
    cp_r Dir.glob("{#{files.join(',')}}"), SANDBOX_PATH
  end
end
