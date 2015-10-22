module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def gravatar_for user, size = ""
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    if size.nil?
      image_tag gravatar_url, alt: user.name, class: "gravatar"
    else
      image_tag gravatar_url, alt: user.name, class: "gravatar", style: "width: #{size}"
    end
  end
end
