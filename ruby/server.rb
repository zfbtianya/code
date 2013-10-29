#! /usr/bin/env ruby
## program name server.rb
case ARGV[0]
when "start"
  $>.puts "called start"
when "stop"
  $>.puts "called stop"
when "restart"
  $>.puts "called restart"
else
  $>.puts <<-EOF
Please provide command name

Usage:
  server start
  server stop
  server restart
EOF
end
