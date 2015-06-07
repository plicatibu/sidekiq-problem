# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)
require 'sidekiq/testing/inline' if RACK_ENV == 'development'

# Load worker definitions
#require Padrino.root('config', 'workers.rb')

require Padrino.root('config', 'sidekiq.rb')

##
# ## Enable devel logging
#
Padrino::Logger::Config[:development][:log_level]  = :devel
Padrino::Logger::Config[:development][:log_static] = true
Sidekiq.logger = Padrino.logger

# ## Configure your I18n
#
# I18n.default_locale = :en
# I18n.enforce_available_locales = false
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  Padrino.require_dependencies Dir[Padrino.root('workers', '**', '*.rb')]
 # Dir[File.expand_path('../workers/*.rb', __FILE__)].each { |file| require file }
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!
