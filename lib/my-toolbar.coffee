module.exports =
  activate: (state) ->
    require('atom-package-deps').install('tool-bar-main')

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'main-tool-bar'

    @toolBar.addButton
      icon: 'document'
      callback: 'application:new-file'
      tooltip: 'New File'
      iconset: 'ion'
    @toolBar.addButton
      icon: 'folder'
      callback: 'application:open-file'
      tooltip: 'Open...'
      iconset: 'ion'
    @toolBar.addButton
      icon: 'archive'
      callback: 'core:save'
      tooltip: 'Save'
      iconset: 'ion'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'search'
      callback: 'find-and-replace:show'
      tooltip: 'Find in Buffer'
      iconset: 'ion'
    @toolBar.addButton
      icon: 'shuffle'
      callback: 'find-and-replace:show-replace'
      tooltip: 'Replace in Buffer'
      iconset: 'ion'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'navicon-round'
      callback: 'command-palette:toggle'
      tooltip: 'Toggle Command Palette'
      iconset: 'ion'
    @toolBar.addButton
      icon: 'gear-a'
      callback: 'settings-view:open'
      tooltip: 'Open Settings View'
      iconset: 'ion'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'monitor'
      callback: 'hydrogen-launcher:launch-jupyter-console-in-platformio-terminal'
      tooltip: 'Launch Jupyter Console'
      iconset: 'ion'
	 
    @toolBar.addSpacer()
	
    @toolBar.addButton
      icon: 'chevron-left'
      callback: 'markdown-folding:cycle'
      tooltip: 'Cycle Markdown Folding State'
      iconset: 'ion'
	  
    if atom.inDevMode()
      @toolBar.addSpacer()

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'ion'
      @toolBar.addButton
        icon: 'terminal'
        callback: ->
          require('remote').getCurrentWindow().toggleDevTools()
        tooltip: 'Toggle Developer Tools'
