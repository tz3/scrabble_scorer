# frozen_string_literal: true

require_relative '../lib/scrabble_scorer_core'

namespace :db do
  desc 'Migrate database version'
  task :create_words do
    Connection.connection.create_table :words do
      primary_key :id
      String :word
    end
    Connection.close
    puts 'Dictionary table created'
  end

  desc 'Setup database migrate'
  task :setup do
    Rake::Task['db:create_words'].invoke
  end
end
