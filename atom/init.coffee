# Specify custom commands in ex-mode
# Found how example from https://discuss.atom.io/t/help-with-custom-ex-mode-command/58112
atom.packages.onDidActivatePackage (pack) ->
  if pack.name == 'ex-mode'
    Ex = pack.mainModule.provideEx()
    # Creates new file with 'new' command
    Ex.registerCommand 'new', -> atom.commands.dispatch(atom.workspace.getActiveTextEditor().element, 'application:new-file')
    Ex.registerCommand 'spl', -> atom.commands.dispatch(atom.workspace.getActiveTextEditor().element, 'pane:split-right-and-copy-active-item')
