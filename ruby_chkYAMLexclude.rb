#!/usr/bin/env ruby

require 'yaml'

file = YAML.load_file('_config.yml')


# check whether exclusion correct or not
errfile = []

file['exclude'].each do |f|
  if (File.exist?(f))
    puts "Note: Excluding #{f}"
  else
    errfile.push(f)
  end
end


if errfile.length > 0
  puts "\n\n\n"
  errfile.each do |f|
    puts "Warning: Typo for file ==> #{f}"
  end
end

puts "\n\n\n"

# current path, puts non-exclusion
Dir.new('.').each do |f|
  if !file['exclude'].include?(f)
    puts "Note: Jekyll-file ==> #{f}"
  end
end

puts ''
puts "DONE everything"
