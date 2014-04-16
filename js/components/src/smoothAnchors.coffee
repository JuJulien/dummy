### smoothAnchors
  # Add an automatic smooth Scroll to the section menu of typo3 or any child link matching ** a[href*="#c"] **
  $.fn.smoothAnchors = (offsetTop, screenOffset) ->
    $anchors = $(this).find("a[href*=\"#c\"]")
    anchorsOffsets = []
    offsetTop = (if offsetTop then offsetTop else 50)
    screenOffset = (if screenOffset then screenOffset else $(window).height() / 6)
    $anchors.each ->
      anchorsOffsets.push $(("#" + $.getHash($(this).attr("href")))).offset().top

    anchorsOffsetsLength = anchorsOffsets.length
    $anchors.unbind "click"
    $anchors.click (e) ->
      e.preventDefault()
      $("html").scrollTo $(("#" + $.getHash($(this).attr("href")))),
        offset:
          top: -offsetTop

        duration: 800


    timeWindow = 500
    lastExecution = new Date((new Date()).getTime())
    $(window).scroll (e) ->
      if (lastExecution.getTime() + timeWindow) <= (new Date()).getTime()
        scrollTop = $(window).scrollTop() + offsetTop + screenOffset
        $anchors.removeClass "active"
        i = 0

        while i < anchorsOffsetsLength
          j = i + 1
          if scrollTop >= anchorsOffsets[i] and not anchorsOffsets[j]
            $anchors.not($anchors[i]).removeClass "active"
            $($anchors[i]).addClass "active"
            lastExecution = new Date((new Date()).getTime())
            return
          else if scrollTop >= anchorsOffsets[i] and scrollTop < anchorsOffsets[j]
            $anchors.not($anchors[i]).removeClass "active"
            $($anchors[i]).addClass "active"
            lastExecution = new Date((new Date()).getTime())
            return
          i++

    return $(this)
###

window.SmoothAnchors = class smoothAnchors
  constructor: (element, offsetTop, screenOffset)->
    this.anchors = element.find("a[href*=\"#c\"]")
    anchorsOffsets = []
    this.offsetTop = (if offsetTop then offsetTop else 50)
    this.screenOffset = (if screenOffset then screenOffset else $(window).height() / 6)
    this.anchors.each ->
      anchorsOffsets.push $(("#" + $.getHash($(this).attr("href")))).offset().top

    anchorsOffsetsLength = anchorsOffsets.length
    this.anchors.unbind "click"
    this.anchors.click (e) ->
      e.preventDefault()
      $("html").scrollTo $(("#" + $.getHash($(this).attr("href")))),
        offset:
          top: -this.offsetTop
        duration: 800

    timeWindow = 500
    lastExecution = new Date((new Date()).getTime())
    $(window).scroll (e) ->
      if (lastExecution.getTime() + timeWindow) <= (new Date()).getTime()
        scrollTop = $(window).scrollTop() + offsetTop + screenOffset
        $anchors.removeClass "active"
        i = 0

        while i < anchorsOffsetsLength
          j = i + 1
          if scrollTop >= anchorsOffsets[i] and not anchorsOffsets[j]
            this.anchors.not(this.anchors[i]).removeClass "active"
            $(this.anchors[i]).addClass "active"
            lastExecution = new Date((new Date()).getTime())
            return
          else if scrollTop >= anchorsOffsets[i] and scrollTop < anchorsOffsets[j]
            this.anchors.not(this.anchors[i]).removeClass "active"
            $(this.anchors[i]).addClass "active"
            lastExecution = new Date((new Date()).getTime())
            return
          i++

    return $(this)