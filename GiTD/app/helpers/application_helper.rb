module ApplicationHelper

  def get_pic(user, area="100x100")
    user.profile_pic.blank? ? (gravatar_tag user.email, size: area, d: "identicon") : (image_tag user.profile_pic, size: area.to_s)
  end

  def get_screenies(game)
    if game.screenshots.size > 0
      image_tag game.screenshots[rand(game.screenshots.size)].url(:thumb)
    else
      image_tag "thumb_gitd_logo.png"
    end
  end

  def get_site(url)
    if url.index("https://")
      url
    elsif url.index("http://")
      "https://"+url[7..url.length]
    else
      "https://"+url
    end
  end

  def format_text(text)
      raw text.gsub(/\n/, "<br>")
  end
end
