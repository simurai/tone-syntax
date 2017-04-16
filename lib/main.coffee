chroma = require 'chroma-js'

root = document.documentElement
uno = ''
duo = ''
tri = ''

module.exports =
  activate: (state) ->
    uno = atom.config.get('tone-dark-syntax.color.uno').toHexString()
    duo = atom.config.get('tone-dark-syntax.color.duo').toHexString()
    tri = atom.config.get('tone-dark-syntax.color.tri').toHexString()
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

  deactivate: ->
    unsetColors()

# Apply Colors -----------------------
setColors = ->
  unsetColors() # prevents adding endless properties

  # Color mixing
  # _unoHigh = chroma.mix( uno, 'hsl(250, 100%, 96%)', 1); # mix with white
  # _unoMid  = uno                                           # set by user
  # _unoLow  = chroma.mix( uno, 'hsl(250, 6%, 33%)', 1); # mix with background (@syntax-bg)
  #
  # _duoHigh = duo                                           # set by user
  # _duoLow  = chroma.mix( duo, 'hsl(250, 12%, 18%)', 0.5); # mix with background (@syntax-bg)
  #
  # _triHigh = tri                                           # set by user
  # _triLow  = chroma.mix( tri, 'hsl(250, 12%, 18%)', 0.5); # mix with background (@syntax-bg)

  # Color scales
  # _scaleUno = chroma.scale([_unoHigh, _unoMid, _unoLow]).colors(3)
  # _scaleDuo = chroma.scale([_duoHigh,          _duoLow]).colors(2)
  # _scaleTri = chroma.scale([_triHigh,          _triLow]).colors(2)

  root.style.setProperty('--uno-1', uno)                                          # <- set by user
  root.style.setProperty('--uno-2', chroma.mix( uno, 'hsl(250, 6%, 18%)', .5))    # how much desaturated background (@syntax-bg)

  root.style.setProperty('--duo-1', duo)                                         # <- set by user
  root.style.setProperty('--duo-2', chroma.mix( duo, 'hsl(250, 12%, 18%)', .5)) # how much background (@syntax-bg)

  root.style.setProperty('--tri-1', tri)                                         # <- set by user
  root.style.setProperty('--tri-2', chroma.mix( tri, 'hsl(250, 12%, 18%)', .5)) # how much background (@syntax-bg)

  root.style.setProperty('--accent', tri)


# Unset Colors -----------------------
unsetColors = ->
  root.style.removeProperty('--uno-1')
  root.style.removeProperty('--uno-2')

  root.style.removeProperty('--duo-1')
  root.style.removeProperty('--duo-2')

  root.style.removeProperty('--tri-1')
  root.style.removeProperty('--tri-2')

  root.style.removeProperty('--accent')
