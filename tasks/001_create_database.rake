# frozen_string_literal: true

require_relative '../lib/scrabble_scorer'

namespace :db do
  desc 'Create database'
  task :create do
    config = ScrabbleScorer::Connection.config
    ScrabbleScorer::Connection.connection(database: false).run("CREATE DATABASE #{config['database']};")
    ScrabbleScorer::Connection.close
    puts 'Database created'
  end
  desc 'Setup database create'
  task :setup do
    Rake::Task['db:create'].invoke
  end
end
