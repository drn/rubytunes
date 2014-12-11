require "bundler/gem_tasks"

task :console do
  require 'pry'
  require 'rubytunes'

  def reload!
    puts 'Reloading...'
    Object.send(:remove_const, :RubyTunes)
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/rubytunes\// }
    files.each { |file| load file }
    true
  end

  ENV['PROMPT_NAME'] = 'RubyTunes'
  ARGV.clear
  Pry.start
end
task c: :console
