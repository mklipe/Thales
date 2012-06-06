Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'GlXvX8PgyahZNNmreCP5Q', 'E3JBRkCmaIVMI2Jra4B9P0HndrzEP8pepTTzvBURPw'
  provider :facebook, '319038018171984', 'e02678fd6d3146966685e04b9c219d57'
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end