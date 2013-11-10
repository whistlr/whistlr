ActionMailer::Base.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587,
  :enable_starttls_auto => true, # detects and uses STARTTLS
  :user_name => ENV['MANDRILL_USER_NAME'],
  :password  => ENV['MANDRILL_PASSWORD'], # SMTP password is any valid API key
  :authentication => 'login', # Mandrill supports 'plain' or 'login'
  :domain => 'whistlr.com', # your domain to identify your server when
}

if Rails.env.production?
  ActionMailer::Base.default_url_options[:host] = "whistlr.com"
else
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end