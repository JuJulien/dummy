### backToTop
  # Display / hide a *back to top* button when scrolling under the gap
  $.fn.backToTop = (gap) ->

    # Initialize
    $that = $(this)
    gap = (if gap then gap else 0)
    $(this).off "click"
    $(this).on "click", (e) ->
      e.preventDefault()
      $("html").scrollTo 0,
        duration: 800

    $(this).off "backToTop.scroll"
    $(this).on "backToTop.scroll", ->
      if $(window).scrollTop() >= gap
        $that.fadeIn()
      else
        $that.fadeOut()


    # If backToTop isn't initiated we trigger a scroll event on the element
    unless $(this).data("backToTop")
      $(window).scroll ->
        $that.trigger "backToTop.scroll"

    $(this).data "backToTop", 1
    return $(this)
###

window.BackToTop = class backToTop
  constructor: (element, gap)->
    this.element = $(element)
    this.gap = (if gap then gap else 0)
    this.element.off "click"
    this.element.on "click", (e)->
      e.preventDefault()
      $("html").scrollTo 0,
        duration: 800
    this.events()

  events: ->
    _this = this
    this.element.off "backToTop.scroll"
    this.element.on "backToTop.scroll", ->
      if $(window).scrollTop() >= _this.gap
        _this.element.fadeIn()
      else
        _this.element.fadeOut()

    unless this.element.data("backToTop")
      $(window).scroll ->
        _this.element.trigger "backToTop.scroll"

    this.element.data "backToTop", 1
    return this.element