#!/usr/bin/env ruby

require "rubygems"
require "liquid"
require "optparse"
require 'pp'


Version = '0.1.0'

class Parser
  def self.parse(options)
    args = Struct.new(:file,:html).new
    OptionParser.new do |opt|
      opt.banner = "Usage: #{__FILE__} [options]"
      opt.separator ""
      opt.separator "Input files:"

      opt.on("-f", "--file [FILE]", String, "input liquid template") do |v|
        args.file = Parser.func_set_file(v)
      end

      opt.on("-t", "--html [FILE]", String, "input html template") do |v|
        args.html = Parser.func_set_file(v)
      end

      opt.separator ""
      opt.separator "Common options:"
      opt.on_tail("-h", "--help", "Show help message") do
        puts opt
        exit
      end
      opt.on_tail("-v", "--version", "Show version") do
        puts "Version #{Version}"
        exit
      end
    end.parse!(options)

    return args
  end

  def self.func_set_file(file)
    if File.file?(file)
      return file
    else
      puts "Fatal: < #{file} > is not a file"
      exit
    end
  end
end


args = Parser.parse(ARGV)

if !args.file
  puts "Fatal: liquid template is not found"
  exit
end

if !args.html
  puts "Note: using default <jekyll-markdown.html>"
  content = File.open("jekyll-markdown.html").read
end


liquid = File.open(args.file).read
puts Liquid::Template.parse(liquid).render("content" => content)



puts "end"
