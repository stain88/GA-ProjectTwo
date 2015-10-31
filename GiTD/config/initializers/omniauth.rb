Rails.application.config.middleware.use OmniAuth::Builder do
  provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :twitter, 'kjYhTFAhe8ih6qnatxQDpauiy', 'JFDS0sWrOWdIE9vyzF0Kk0bwAnhOGD4jkpQbyn7P8q38K8QxhQ'
end