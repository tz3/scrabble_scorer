# frozen_string_literal: true

require_relative '../lib/scrabble_scorer_core'

namespace :db do
  desc 'Migrate database'
  task :add_index do
    Connection.connection.run('CREATE INDEX index_words_on_word ON words (word);')
    Connection.close
    puts 'add_index for words was added'
  end

  desc 'Setup database migrate'
  task :setup do
    Rake::Task['db:add_index'].invoke
  end
end
