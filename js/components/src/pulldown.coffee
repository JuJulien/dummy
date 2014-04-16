# Pulldown
  # Show/Hide content of pulldown element on click on the first child (button) of each elements
  # Use css to do the toggle.

### Initialize
    $list = $(this)
    $items = $list.children()
    $buttons = $items.find("> *:first-child")
    $items.addClass "close"
    $buttons.addClass "pulldownButton"
    $buttons.unbind " click"
    $buttons.on "click", (e) ->
      e.preventDefault()


    # Add class to hide non-button elements
    $items.children().not($buttons).addClass "pulldownContent"
    $items.data "state", 0

    # Bind click events
    $items.on "click", (e) ->
      e.preventDefault()
      $item = $(this)
      if $item.data("state")
        # Close
        $item.data("state", 0).addClass "close"
      else
        # Open
        $item.data("state", 1).removeClass "close"
        $items.not($item).data("state", 0).addClass "close"

    $list.data "pulldown", 1
    return $(this)
###

window.Pulldown = class Pulldown
  constructor: (element)->
    this.list = $(element)
    this.items = this.list.children()
    this.buttons = this.items.find("> *:first-child")
    this.items.addClass "close"
    this.buttons.addClass "pulldown"
    this.buttons.on "click", (e)->
      e.preventDefault()
    this.hide()
    this.events()

  hide:->
    this.items.children().not(this.buttons).addClass "pulldownContent"
    this.items.data "state", 0

  events:->
    elements = this.items
    elements.on "click", (e)->
      e.preventDefault()
      this.item = $(this)
      if this.item.data("state")
        this.item.data("state", 0).addClass "close"
      else
        this.item.data("state", 1).removeClass "close"
        elements.not(this.item).data("state", 0).addClass "close"
    this.list.data "pulldown", 1
    return this