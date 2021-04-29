require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)

class BoardCase

	attr_accessor :box_name, :box_value

	def initialize(name)
		@box_name = name
		@box_value = ""
	end

end
