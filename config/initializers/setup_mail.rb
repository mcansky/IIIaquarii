ActionMailer::Base.delivery_method = Settings.mail.delivery_method.to_sym

ActionMailer::Base.default_url_options[:host] = Settings.application.hostname
