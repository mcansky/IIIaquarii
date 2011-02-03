module ApplicationHelper
  def is_text? fname
    if fname =~ /^(text)\/(.*)$/ or
        fname =~ /^(application)\/(javascript|xhtml\+xml|json|xml|ruby|x-ruby|python|x-python)$/
      return true
    else
      return false
    end
  end

  def is_image? fname
    if fname =~ /^(image)\/(gif|jpeg|png|svg\+xml)$/
      return true
    else
      false
    end
  end
end
