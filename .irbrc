# encoding: utf-8

require 'rubygems' unless defined? Gem

# enables variable-name tab-completion
# I don’t care about the other features in here; I think irbtools already
#  provides them, but there’s little harm in leaving them in
# from http://www.genlinux.org/2008/12/autocomplete-in-irb.html
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] = []  unless IRB.conf.key?(:LOAD_MODULES)
unless IRB.conf[:LOAD_MODULES].include?('irb/completion')
	IRB.conf[:LOAD_MODULES] << 'irb/completion'
end

def enable_irbtools
	# require 'irbtools'
	require 'irbtools/more'
	# not using `require 'irbtools/more'` because Bond self-admittedly has errors since
	#  “EditLine” is also installed, and EditLine is confusing to remove or replace
rescue LoadError => e
	# puts e.message # to help debug this rescue clause
	raise unless e.message.match(/irbtools/)
	puts "‘irbtools’ not installed - see install notes on https://github.com/janlelis/irbtools"
end
enable_irbtools

# prefabricated values of various types
#  to make it easier to start experimenting with values of those types
# `include SampleValues` to import them; `SampleValues::HASH` to reference them
module SampleValues
	HASH = {:a => 1, :b => 2}
	SYM = :wherever
	BIG_SYM = "Benjamin Franklin".to_sym
	MIXED_ARRAY = [1, 2, nil, 4, true, 6, false, "eight", 9, /ten/, :eleven, 12]
	REGEX = /a regex [w]ith character class(es)? and (?:more ?)+/
end

# Hirb
Hirb.enable({width: 155, height: 500}) if defined? Hirb

# Console prompt
#

class IRB::Irb
  alias :original_prompt :prompt
  def prompt(prompt, ltype, indent, line_no)
	prompt = prompt.call if prompt.respond_to?(:call)
	original_prompt(prompt, ltype, indent, line_no)
  end
end

if ENV['RAILS_ENV']
  rails_env = ENV['RAILS_ENV'].downcase
elsif Rails and Rails.env
  rails_env = Rails.env.downcase
end

if rails_env
  current_app = ENV["MARCO_POLO_APP_NAME"] || Rails.application.class.parent_name.underscore.gsub("_", "-")

  # shorten some common long environment names and set color
  red = "\e[0;31m"
  green = "\e[0;32m"
  reset = "\e[0m"

  if rails_env == "development"
    rails_env = "dev"
    color = green
  end
  if rails_env == "production"
    rails_env = "prod"
    color = red
  end
end

app_and_env = "#{current_app}#{color}[#{rails_env}]#{reset}"

IRB.conf[:PROMPT_MODE] = :RAILS_ENV
# # IRB.conf[:PROMPT][:RAILS_ENV] = IRB.conf[:PROMPT][:CLASSIC].merge(:PROMPT_I => lambda { (defined?(Rails) ? "#{current_app}[#{rails_env}] " : "") + "%N(%m):%03n:%i> " })
IRB.conf[:PROMPT][:RAILS_ENV] = IRB.conf[:PROMPT][:CLASSIC].merge(:PROMPT_I => lambda { (defined?(Rails) ? "#{app_and_env} " : "") + "%N(%m):%03n:%i> " })
