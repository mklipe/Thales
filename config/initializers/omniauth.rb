OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'GlXvX8PgyahZNNmreCP5Q', 'E3JBRkCmaIVMI2Jra4B9P0HndrzEP8pepTTzvBURPw'
  provider :facebook, ENV['319038018171984'], ENV['93e0d4b4d91ed3c220e826cbd136fb9c']
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end