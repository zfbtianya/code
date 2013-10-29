#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'

program :version, '0.0.1'
program :description, 'stupid command that prints foo or bar.'
 
command :foo do |c|
  c.syntax = 'foobar foo'
  c.summary = ''
  c.description = 'Displays foo'
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    # Do something or c.when_called Ubuntu::Commands::Name
    say 'foo'
  end
end

command :bar do |c|
  c.syntax = 'foobar bar [options]'
  c.description = 'Displays bar with optional prefix and suffix'
  c.option '--prefix STRING', String, 'Adds a prefix to bar'
  c.option '--suffix STRING', String, 'Adds a suffix to bar'
  c.action do |args, options|
    options.default :prefix => '(', :suffix => ')'
    say "#{options.prefix}bar#{options.suffix}"
  end
end
# Ask for password masked with '*' character
ask("Password: ") { |q| q.echo = "*"}
# Ask if the user agrees (yes or no)
agree("Do something?")
# Ask on a single line (note the space after ':')
ask("Name: ")
# Ask with new line after "Description:"
ask("Description:")
# Calls Date#parse to parse the date string passed
ask("Birthday? ", Date)
# Ensures Integer is within the range specified
ask("Age? ", Integer) { |q| q.in = 0..105 }
# Asks for a list of strings, converts to array
ask("Fav colors?", Array)
password "Enter your password please:", '-'
