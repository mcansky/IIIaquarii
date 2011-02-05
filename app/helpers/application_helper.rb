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


  def highlight(filename, mimetype, text, options = {})
    # Try GitHub::Markup first
    if GitHub::Markup.can_render?(filename)
      return GitHub::Markup.render(filename, text)
    end

    # Try using Albino
    lexer = PygmentsLexersList.get_lexer_by_filename(filename)

    if lexer
      syntaxer = Albino.new(text, lexer[:keywrd])
      return syntaxer.colorize(options)
    end

    # We can't highlight... return the text
    return "<pre>#{text}</pre>"
  end


end
