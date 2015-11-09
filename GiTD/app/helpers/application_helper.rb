module ApplicationHelper

  def get_pic(user, area="100x100")
    user.profile_pic.blank? ? (gravatar_tag user.email, size: area, d: "identicon") : (image_tag user.profile_pic, size: area.to_s)
  end

  def get_screenies(game)
    if game.screenshots.size > 0
      if game.screenshots[0].url.index("%5B").to_i > 0
        a = game.screenshots[0].url[0..game.screenshots[0].url.index("%").to_i-1]
        b = game.screenshots[0].url[game.screenshots[0].url.index("%5B").to_i..game.screenshots[0].url.length]
        c = b[6..-7].split("%22%2C%20%22")
        image_tag a+"thumb_"+c[rand(c.size)]
      else
        image_tag game.screenshots[0].url(:thumb).to_s
      end
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
