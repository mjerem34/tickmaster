atom.commands.add 'atom-text-editor', 'custom:cut-line', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.save()
