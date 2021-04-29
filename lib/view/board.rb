require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'view/boardcase'
require 'view/show'
require 'app/player'
