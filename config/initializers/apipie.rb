Apipie.configure do |config|
  config.app_name                = "TlToday"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  config.copyright = "&copy; 2020 Vladimir Vulkanfry Sidorenko"
  config.api_routes = Rails.application.routes
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.languages = ['en', 'ru']
  config.default_locale = 'en'
  config.locale = lambda { |loc| loc ? I18n.locale = loc : I18n.locale }
  config.translate = lambda do |str, loc|
    return '' if str.blank?
    I18n.t str, locale: loc
  end
end
