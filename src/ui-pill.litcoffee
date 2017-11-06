#ui-pill
A pill is a little bit of text with a remove flag. You can use this to display
tags and flags. It will show any content you like.

    Polymer 'ui-pill',

##Events
###click
Fired when you click on the pill itself.
###remove
Fired when you click on the little `X`, this let's any parent deal.

##Attributes and Change Handlers

##Methods

###remove

      remove: (evt)->
        evt?.stopPropagation()
        width = @$.pill.offsetWidth
        height = @$.pill.offsetHeight
        @$.pill.classList.add 'hide'
        @fire 'remove', @templateInstance.model

##Event Handlers

      pointerdown: ->
        @$.pill.classList.add 'pressed'
      pointerup: ->
        @$.pill.classList.remove 'pressed'

##Polymer Lifecycle

      attached: ->
        width = @$.pill.offsetWidth
        height = @$.pill.offsetHeight
        anim = @$.pill.animate [
          {width: '0', height: height, transform: 'rotateX(90deg)', offset: 0}
          {width: width, height: height, transform: 'rotateX(90deg)', offset: 0.5}
          {width: width, height: height, transform: 'rotateX(0deg)', offset: 1}
        ], duration: 300
