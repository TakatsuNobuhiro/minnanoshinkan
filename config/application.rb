require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0 # 以下を追加すれば日本語に
    config.i18n.default_locale = :ja # タイムゾーンも変更するなら，以下を追加
    config.time_zone = 'Asia/Tokyo' # the framework and any gems in your application.
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       controller_specs: false,
                       routing_specs: false
    end
  end
end
