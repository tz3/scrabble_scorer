# frozen_string_literal: true

require_relative '../lib/scrabble_scorer_core'

namespace :db do
  desc 'Migrate database'
  task :load_dictionary do
    File.read('data/sowpods.txt').each_line do |word|
      Word.create(word.strip)
    end
    puts 'dictionary loaded'
  end

  desc 'Setup database migrate'
  task :load_dictionary do
    Rake::Task['db:load_dictionary'].invoke
  end
end
