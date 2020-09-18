#!/usr/bin/env ruby

require "rubygems"
require "liquid"
require "kramdown"
require "ostruct"
require "optparse"

Version = '0.2.0'

Feature = [
  '* Version 0.1.0: Ruby-liquid Debug',
  '* Version 0.2.0: Add Kramdown conversion',
  '* Version 0.2.1: Change args type from Struct to Hash',
]


class Parser
  def self.parse(options)
    # Hash to contain all settings
    args = {}
    OptionParser.new do |opt|
      opt.banner = "Usage: #{__FILE__} [options]"
      opt.separator ""
      opt.separator "Input files:"

      opt.on("-f", "--file [FILE]", String, "input liquid template") do |v|
        args[:file] = Parser.func_set_file(v)
      end

      opt.on("-t", "--html [FILE]", String, "input html template") do |v|
        args[:html] = Parser.func_set_file(v)
      end

      opt.on("-k", "--md [FILE]", String, "input raw markdown file, precedent for option `-t'") do |v|
        args[:kmd] = Parser.func_set_file(v)
      end

      opt.on("--md2html", TrueClass, "valid when `-k' is set, output converted html file, overwrite may happen") do |v|
        args[:md2html] = true
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
      opt.on_tail("--feature", "Show development feature") do
        Feature.each { |x| puts x }
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
# make Hash dottable
args = OpenStruct.new(args)


if args.kmd
  puts "Note: using raw #{args.kmd}"
  # read raw kramdown
  content = File.open(args.kmd).read
  # html conversion
  content = Kramdown::Document.new(content).to_html
  # output html if set
  if args.md2html
    name = File.basename(args.kmd,".*") + ".html"
    File.new(name,'w').write(content)
  end
elsif args.html
  puts "Note: using #{args.html}"
  content = File.open(args.html).read
else
  puts "Note: using default <jekyll-markdown.html>"
  content = File.open("jekyll-markdown.html").read
end


if args.file
  liquid = File.open(args.file).read
  puts Liquid::Template.parse(liquid).render("content" => content)
end



puts "DONE everything"
