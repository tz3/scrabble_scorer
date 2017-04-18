#!/usr/bin/env rake
# frozen_string_literal: true

require 'rake/testtask'
Dir.glob('tasks/**/*.rake').each { |f| load f }
Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end
