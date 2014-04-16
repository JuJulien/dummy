# ## hoverSrc
  # Emulate a hover state for images
  $.fn.hoverSrc = (on_, off_) ->

    # ### Initialize
    # Use hover / off suffixes or those given
    suffixeOn = (if on_ then on_ else "-hover")
    suffixeOff = (if off_ then off_ else "-off")

    # ### hoverIn()
    # Add the on suffixe to the image name
    hoverIn = ->
      unless $(this).hasClass("active")
        srcName = $(this).attr("src")
        srcName = srcName.replace(suffixeOff, suffixeOn)
        $(this).attr src: srcName

    # ### hoverOut()
    # Add the off suffixe to the image name
    hoverOut = ->
      unless $(this).hasClass("active")
        srcName = $(this).attr("src")
        srcName = srcName.replace(suffixeOn, suffixeOff)
        $(this).attr src: srcName

    # Bind events
    $(this).each ->
      $(this).bind "focus mouseenter", hoverIn
      $(this).bind "blur mouseleave", hoverOut
      (new Image()).src = $(this).attr("src").replace("-off", "-hover")

    return $(this)