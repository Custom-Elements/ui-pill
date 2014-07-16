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
###show

      show: ->
        @hiding = false
        @$.pill.classList.remove 'compress'

###hide

      hide: ->
        @hiding = true
        @$.pill.classList.add 'flip'

##Event Handlers

      onTransition: ->
        if @hiding
          if not @$.pill.classList.contains 'compress'
            @$.pill.classList.add 'compress'
          else
            @fire 'remove'
        else
          @$.pill.classList.remove 'flip'

      onRemove: (e, _, src) ->
        e.stopPropagation()
        @hide()


##Polymer Lifecycle

      attached: ->
        @async =>
          @show()
        , null, 200
