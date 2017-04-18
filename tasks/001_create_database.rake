# frozen_string_literal: true

require_relative '../lib/scrabble_scorer_core'

namespace :db do
  desc 'Create database'
  task :create do
    config = Connection.config
    Connection.connection(database: false).run("CREATE DATABASE #{config['database']};")
    Connection.close
    puts 'Database created'
  end
  desc 'Setup database create'
  task :setup do
    Rake::Task['db:create'].invoke
  end
end
