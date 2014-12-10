require "bundler/gem_tasks"

task :console do
  require 'pry'
  require 'rubytunes'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/rubytunes\// }
    files.each { |file| load file }
  end

  ENV['PROMPT_NAME'] = 'RubyTunes'
  ARGV.clear
  Pry.start
end
task c: :console
