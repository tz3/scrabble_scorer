# frozen_string_literal: true

require_relative '../lib/scrabble_scorer'

namespace :db do
  desc 'Migrate database'
  task :load do
    File.read('data/sowpods.txt').each_line do |word|
      ScrabbleScorer::Word.create(word.strip)
    end
    puts 'words loaded'
  end

  desc 'Setup database migrate'
  task :load do
    Rake::Task['db:load'].invoke
  end
end
