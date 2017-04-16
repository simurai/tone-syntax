chroma = require 'chroma-js'

root = document.documentElement
uno = ''
duo = ''
tri = ''
bg = ''

module.exports =
  activate: (state) ->
    uno = atom.config.get('tone-dark-syntax.color.uno').toHexString()
    duo = atom.config.get('tone-dark-syntax.color.duo').toHexString()
    tri = atom.config.get('tone-dark-syntax.color.tri').toHexString()
    bg  = atom.config.get('tone-dark-syntax.color.bg').toHexString()
    setColors()

    # Change Uno
    atom.config.onDidChange 'tone-dark-syntax.color.uno', ({newValue, oldValue}) ->
      uno = newValue.toHexString()
      setColors()

    # Change Duo
    atom.config.onDidChange 'tone-dark-syntax.color.duo', ({newValue, oldValue}) ->
      duo = newValue.toHexString()
      setColors()

    # Change Tri
    atom.config.onDidChange 'tone-dark-syntax.color.tri', ({newValue, oldValue}) ->
      tri = newValue.toHexString()
      setColors()

    # Change BG
    atom.config.onDidChange 'tone-dark-syntax.color.bg', ({newValue, oldValue}) ->
      bg = newValue.toHexString()
      setColors()

  deactivate: ->
    unsetColors()

# Apply Colors -----------------------
setColors = ->
  unsetColors() # prevents adding endless properties

  root.style.setProperty('--uno-1', uno)                        # <- set by user
  root.style.setProperty('--uno-2', chroma.mix( uno, bg, .5))   # how much bg

  root.style.setProperty('--duo-1', duo)                        # <- set by user
  root.style.setProperty('--duo-2', chroma.mix( duo, bg, .5))   # how much bg

  root.style.setProperty('--tri-1', tri)                        # <- set by user
  root.style.setProperty('--tri-2', chroma.mix( tri, bg, .5))   # how much bg

  root.style.setProperty('--bg-1', bg)                          # <- set by user
  root.style.setProperty('--bg-2', chroma.mix( bg, uno, .05))   # how much uno
  root.style.setProperty('--bg-3', chroma.mix( bg, uno, .15))   # how much uno

  root.style.setProperty('--fg-1', chroma.mix( bg, uno, .3))    # how much uno
  root.style.setProperty('--fg-2', chroma.mix( bg, uno, .1))    # how much uno

  root.style.setProperty('--accent', tri)


# Unset Colors -----------------------
unsetColors = ->
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
