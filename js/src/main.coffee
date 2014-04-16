# main: website wide scripts
$ ->
  $(window).ready ->

    # Handle src update on hover event
    #$(".no-touch img.hover").hoverSrc()

    # Enable placeholder management for outdated browsers
    unless !Modernizr.input.placeholder
      $("input").each ->
        $(this).placeholder()  unless $(this).attr("placeholder") is ""

    # Handle pulldown
    pulldown = new Pulldown(".pulldown")

    # Add backToTop anchor when half a screen  is scrolled
    $('body').append('<a id="backToTop" href="#">Back to top</a>')
    backToTop = new BackToTop("#backToTop", $(window).height()/2)

    # Handle pulldown

    # Refresh scroll offset of backToTop button appearance
    $(window).bind 'resize', ->
      backToTop


#TODO MOVE IT

#Helpers

  # getHash
  $.getHash = (url) ->

    # Return the HashTag of the given url : parameter or current
    (if url then url.substring(url.indexOf("#") + 1) else window.location.hash)
