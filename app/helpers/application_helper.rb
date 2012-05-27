module ApplicationHelper
  def dom_class_for_controller
    params[:controller].split('/').map { |c| c.camelize }.join(' ')
  end

  def dom_id_for_action
    params[:action].camelize
  end

  def twitter_share_link(book, drink)
    status = "Enjoying #{book.title} with a #{drink.name} on the side. http://#{request.host_with_port}/#{book.title}"
    URI::HTTP.build(
      :host => 'twitter.com',
      :path => '/home',
      :query => { :status => status }.to_query
    ).to_s
  end

  def facebook_share_link(book, drink)
    url =  "http://#{request.host_with_port}/#{book.title}"
    URI::HTTP.build(
      :host => 'www.facebook.com',
      :path => '/share.php',
      :query => {:u => url}.to_query
    ).to_s
  end
end
