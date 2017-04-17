
# Tone dark

fs = require 'fs'
chroma = require 'chroma-js'

# Variables
root = document.documentElement
syntaxVariablesPath = "#{__dirname}/../styles/syntax-variables.less"
writeSyntaxVariablesTimeout = null
syncUI = null

# Colors
uno1 = ''
uno2 = ''
duo1 = ''
duo2 = ''
tri1 = ''
tri2 = ''
bg1 = ''
bg2 = ''
bg3 = ''
fg1 = ''
fg2 = ''


module.exports =
  activate: (state) ->
    uno1 = atom.config.get('tone-dark-syntax.color.uno').toHexString()
    duo1 = atom.config.get('tone-dark-syntax.color.duo').toHexString()
    tri1 = atom.config.get('tone-dark-syntax.color.tri').toHexString()
    bg1  = atom.config.get('tone-dark-syntax.color.bg').toHexString()
    syncUI  = atom.config.get('tone-dark-syntax.color.syncUI')

    setColors()

    # Change Uno
    atom.config.onDidChange 'tone-dark-syntax.color.uno', ({newValue, oldValue}) ->
      uno1 = newValue.toHexString()
      setColors()
      unSyncUI()

    # Change Duo
    atom.config.onDidChange 'tone-dark-syntax.color.duo', ({newValue, oldValue}) ->
      duo1 = newValue.toHexString()
      setColors()
      unSyncUI()

    # Change Tri
    atom.config.onDidChange 'tone-dark-syntax.color.tri', ({newValue, oldValue}) ->
      tri1 = newValue.toHexString()
      setColors()
      unSyncUI()

    # Change BG
    atom.config.onDidChange 'tone-dark-syntax.color.bg', ({newValue, oldValue}) ->
      bg1 = newValue.toHexString()
      setColors()
      unSyncUI()

    # Change Sync UI
    atom.config.onDidChange 'tone-dark-syntax.color.syncUI', ({newValue, oldValue}) ->
      syncUI = newValue
      if syncUI is true then updateSyntaxVariables(syntaxVariablesPath)

  deactivate: ->
    unsetColors()



# Set Colors -----------------------

setColors = ->

  # Create all different shades

  # uno1                              # <- set by user
  uno2 = chroma.mix( uno1, bg1, .5)   # how much bg

  # duo1                              # <- set by user
  duo2 = chroma.mix( duo1, bg1, .5)   # how much bg

  # tri1                              # <- set by user
  tri2 = chroma.mix( tri1, bg1, .5)   # how much bg

  # bg1                               # <- set by user
  bg2 = chroma.mix( bg1, uno1, .05)   # how much uno
  bg3 = chroma.mix( bg1, uno1, .15)   # how much uno

  fg1 = chroma.mix( bg1, uno1, .3)    # how much uno
  fg2 = chroma.mix( bg1, uno1, .1)    # how much uno


  # Remove all properties
  # Prevents adding endless properties
  unsetColors()

  # Update custom properties
  root.style.setProperty('--uno-1', uno1)
  root.style.setProperty('--uno-2', uno2)

  root.style.setProperty('--duo-1', duo1)
  root.style.setProperty('--duo-2', duo2)

  root.style.setProperty('--tri-1', tri1)
  root.style.setProperty('--tri-2', tri2)

  root.style.setProperty('--bg-1', bg1)
  root.style.setProperty('--bg-2', bg2)
  root.style.setProperty('--bg-3', bg3)

  root.style.setProperty('--fg-1', fg1)
  root.style.setProperty('--fg-2', fg2)

  root.style.setProperty('--accent', tri1)



# Unset Colors -----------------------

unsetColors = ->
  # Remove all properties (e.g. when switching to another theme)
  root.style.removeProperty('--uno-1')
  root.style.removeProperty('--uno-2')

  root.style.removeProperty('--duo-1')
  root.style.removeProperty('--duo-2')

  root.style.removeProperty('--tri-1')
  root.style.removeProperty('--tri-2')

  root.style.removeProperty('--bg-1')
  root.style.removeProperty('--bg-2')
  root.style.removeProperty('--bg-3')

  root.style.removeProperty('--fg-1')
  root.style.removeProperty('--fg-2')

  root.style.removeProperty('--accent')



# Syntax Variables -----------------------

unSyncUI = ->
  # Mark the syntax variables as "out of sync"
  if syncUI is true then atom.config.set('tone-dark-syntax.color.syncUI', false)


generateSyntaxVariables = ->
  # Here all the Syntax Variables get filled with the right values
  syntaxVariables = """
    // Official Syntax Variables -----------------------------------
    // Generated from lib/main.coffee

    // General colors
    @syntax-text-color:            #{uno1};
    @syntax-cursor-color:          #{tri1};
    @syntax-selection-color:       #{bg3};
    @syntax-selection-flash-color: #{tri1};
    @syntax-background-color:      #{bg1};

    // Guide colors
    @syntax-wrap-guide-color:          #{bg2};
    @syntax-indent-guide-color:        #{fg2};
    @syntax-invisible-character-color: #{fg2};

    // For find and replace markers
    @syntax-result-marker-color:          #{tri1};
    @syntax-result-marker-color-selected: #{tri1};

    // Gutter colors
    @syntax-gutter-text-color:                #{fg1};
    @syntax-gutter-text-color-selected:       #{uno1};
    @syntax-gutter-background-color:          #{bg1};
    @syntax-gutter-background-color-selected: #{bg2};

    // For git diff info. i.e. in the gutter
    @syntax-color-renamed:  hsl(208, 100%, 60%);
    @syntax-color-added:    hsl(150,  60%, 54%);
    @syntax-color-modified: hsl(40,   60%, 70%);
    @syntax-color-removed:  hsl(0,    70%, 60%);
  """
  return syntaxVariables


updateSyntaxVariables = ->
  # Only write to syntax-variables.less after a short delay
  # Because some people just love to stress-test checkboxes
  clearTimeout(writeSyntaxVariablesTimeout)
  writeSyntaxVariablesTimeout = setTimeout( ->
    fs.writeFileSync syntaxVariablesPath, generateSyntaxVariables()
  1000)
