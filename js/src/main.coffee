(($) ->
  $(document).ready ->

    # handle src update on hover event
    $("img.hover").hoverSrc()

    # enable placeholder management for updated browsers
    unless Modernizr.input.placeholder
      $("input").each ->
        $(this).placeholder()  unless $(this).attr("placeholder") is ""

    jQuery("#mainNav").in_jMenu null,
      $toggleBtn: jQuery("<a href=\"javascript:;\" class=\"in_jMenu-toggleBtn\"></a>")
      userInterfaces:
        smallscreen: "jQuery('#header').after($(this).parent());"
        desktop: "jQuery('#header .page').append($(this).parent());"
        toggleBtn: "jQuery('#logo').after(o.$toggleBtn);"

      columnsTemplate: []

    jQuery(window).resize ->

      # switch UI handler for the main in_menu
      if jQuery(window).width() <= 660
        jQuery("#mainNav").find("br").replaceWith "&nbsp;"

        # jQuery('#mainNav li a').html(jQuery('#mainNav li a').html().replace('&nbsp;','<br />'));
        jQuery("#mainNav").in_jMenu "setUI",
          UI: "smallscreen"

      else
        jQuery("#mainNav li a").each ->
          jQuery(this).html jQuery(this).html().replace("&nbsp;", "<br />")

        jQuery("#mainNav").in_jMenu "setUI",
          UI: "desktop"



    # trigger a resize event to initalize UI handler
    jQuery(window).trigger "resize"

) jQuery