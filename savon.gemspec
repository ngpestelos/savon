# -*- encoding : utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$:.unshift lib unless $:.include? lib

require 'savon/version'

Gem::Specification.new do |s|
  s.name        = 'savon'
  s.version     = Savon::VERSION
  s.authors     = 'Daniel Harrington'
  s.email       = 'me@rubiii.com'
  s.homepage    = 'http://savonrb.com'
  s.summary     = 'Heavy metal SOAP client'
  s.description = 'Savon is a SOAP client for the Ruby community.'

  s.rubyforge_project = s.name
  s.license = 'MIT'

  # TODO: get rid of Nori.
  s.add_dependency 'nori',     '~> 2.2.0'

  s.add_dependency 'nokogiri',   '>= 1.4.0'
  s.add_dependency 'builder',    '>= 3.0.0'
  s.add_dependency 'httpclient', '~> 2.3'
  s.add_dependency 'logging',    '~> 1.8'

  s.add_development_dependency 'rake',  '~> 10.1'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'mocha', '~> 0.14'
  s.add_development_dependency 'equivalent-xml', '~> 0.3'

  ignores  = File.readlines('.gitignore').grep(/\S+/).map(&:chomp)
  dotfiles = %w[.gitignore .travis.yml .yardopts]

  all_files_without_ignores = Dir['**/*'].reject { |f|
    File.directory?(f) || ignores.any? { |i| File.fnmatch(i, f) }
  }

  s.files = (all_files_without_ignores + dotfiles).sort

  s.require_path = 'lib'
end
