#ui-pill-list
*TODO* tell me all about your element.


    Polymer 'ui-pill-list',

##Events
*TODO* describe the custom event `name` and `detail` that are fired.

##Attributes and Change Handlers
      
      itemsChanged: (oldVal, items) ->
        template = @querySelector("template")
        template.model = {items} if template

##Methods

      add: (item) -> 
        @items = @items.concat(item)

##Event Handlers

      onClick: (e) ->
        return if e.target == @
        @fire "pill-clicked", {target:e.target}

##Polymer Lifecycle

      created: ->
        @items ||= []

      attached: ->
        
        @addEventListener "pill-removed", (e) ->
          e.stopPropagation()
          for child in @children
            @removeChild child if child == e.detail.target
