# ## placeholder
  # Must only be called only for browser not supporting placeholder attribute

  ### ```javascript
  unless Modernizr.input.placeholder
    $("input").each ->
      $(this).placeholder() unless $(this).attr("placeholder") is ""
  ``` ###
  $.fn.placeholder = ->

    # ### Initialize
    # Store placeholder value and fill the input
    $(this).data("placeholder", $(this).attr("placeholder"))
    $(this).val(jQuery(this).attr("placeholder"))

    # ### emptyMe()
    # Empty the previous value on focus
    emptyMe = ->
      $(this).val ""  if $(this).val() is $(this).attr("placeholder")
      return

    #emptyMe = ->
     # $(this).data "placeholder", $(this).val()
      #$(this).val ""

    # ### fullMe()
    # Reset the value if nothing is found in the input on blur
    fullMe = ->
      $(this).val($(this).data("placeholder"))  if $(this).val() is ""

    # ### Bind events
    $(this).on "focus", emptyMe
    $(this).on "blur", fullMe
    return $(this)