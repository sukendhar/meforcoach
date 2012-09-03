Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '444184248955232', '278f7eb1ea007de1207c4406bfee1b55',:client_options => {:ssl => {:ca_path => "/usr/lib/ssl/certs/ca-certificates.crt"}}
end