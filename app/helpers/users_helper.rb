module UsersHelper
    
# Returns the Gravatar for the given user. (The Profile img)
  def gravatar_for(user, options = { size: 100 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")#"profile.png", alt: "profile picture", class:"gravatar")#gravatar_url, alt: user.name, class: "gravatar")
  end
end
