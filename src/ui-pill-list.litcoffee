#ui-pill-list
*TODO* tell me all about your element.


    Polymer 'ui-pill-list',

##Events
*TODO* describe the custom event `name` and `detail` that are fired.

##Attributes and Change Handlers

      itemsChanged: (oldVal, items) ->
        @setValue(items)

##Methods

      setValue: (value) ->
        console.log value
        if @useDefault
          @items = value
        else
          @template.model = {items:value}

      getValue: () ->
        values = []
        for child in @querySelectorAll("ui-pill")
          values.push child.value || child.templateInstance?.model || child.innerText

        for child in @shadowRoot.querySelectorAll("ui-pill")
          values.push child.templateInstance.model
        values

      add: (item) -> 
        @items = @items.concat(item)

##Event Handlers


##Polymer Lifecycle

      created: ->
        # does the lightdom have a template, if so it's a custom renderer
        @template = @querySelector("template")
        @useDefault = @template == null

        #getters/setters in coffeescript
        Object.defineProperty @, "value",
          get: @getValue
          set: @setValue

      attached: ->
        
        @addEventListener "pill-removed", (e) ->
          e.stopPropagation()
          
          #lightdom children
          for child in @querySelectorAll("ui-pill")
            @removeChild child if child == e.detail.target

          #shadowdom children
          for child in @shadowRoot.querySelectorAll("ui-pill")
            @shadowRoot.removeChild child if child == e.detail.target
