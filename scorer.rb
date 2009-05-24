$: << File.expand_path(File.join(File.dirname(__FILE__), 'lib'))

require 'scorer'
require 'string_ext'


puts "hello world".score("abc")
puts "hello world".score("hel")
