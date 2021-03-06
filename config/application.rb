# require 'config/initializers/monkey_magic'
jar_path = File.expand_path('../../lib/RelJDBC.jar', __FILE__)
# puts jar_path
$CLASSPATH << jar_path

require File.expand_path('../boot', __FILE__)

require 'rails/all'
java.lang.Class.for_name('javax.crypto.JceSecurity')
    .get_declared_field('isRestricted')
    .tap do |f|
  f.accessible = true
  f.set nil, false
end

require 'csv'
require File.expand_path('../boot', __FILE__)

Bundler.require(*Rails.groups)

module GmanServices
  class Application < Rails::Application
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.test_framework :rspec, fixture: false
      g.view_specs false
      g.helper_specs false
    end

    config.secret_key_base = Figaro.env.SECRET_KEY_BASE
  end
end
