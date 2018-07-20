require 'optparse'
require './lib/xml_parser'

options = {}
OptionParser.new do |opt|
  opt.on('--file FILE') { |o| options[:file] = o }
  opt.on('--xpath XPATH') { |o| options[:xpath] = o }
  opt.on('--command COMMAND') { |o| options[:command] = o }
  opt.on('--optional OPTIONAL') { |o| options[:optional] = o }
end.parse!


puts case options[:command]
       when 'show'
       	XMLParser.new.parse(options[:file], xpath: options[:xpath])
       else
       	XMLParser.new.parse(options[:file], xpath: options[:xpath], command: options[:command], optional: options[:optional])
       end
