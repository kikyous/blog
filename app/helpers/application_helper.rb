module ApplicationHelper
  require 'digest/md5'
  def gravatar user,options= { style: 'width: 64px; height: 64px;', class: 'media-object'}
    email = user.email rescue ''
    md5=Digest::MD5.hexdigest(email)
    md5 = "#{md5}?s=#{options[:s]}" if options[:s]
    image_tag "http://www.gravatar.com/avatar/#{md5}", options
  end
end
