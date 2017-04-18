# frozen_string_literal: true

require_relative '../lib/scrabble_scorer'

namespace :db do
  desc 'Migrate database version'
  task :migrate do
    ScrabbleScorer::Connection.connection.create_table :words do
      primary_key :id
      String :word
    end
    ScrabbleScorer::Connection.connection.run('CREATE UNIQUE INDEX index_words_on_word ON words (word);')
    ScrabbleScorer::Connection.close
    puts 'Words table created'
  end

  desc 'Setup database migrate'
  task :setup do
    Rake::Task['db:migrate'].invoke
  end
end
