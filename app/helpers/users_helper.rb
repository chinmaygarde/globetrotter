module UsersHelper
  def gravatar(email_address)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email_address)}.jpg"
  end
end
