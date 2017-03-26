# Tone dark

An Atom theme with 3 customizable colors.

<img alt="DuoTone dark" sizes="272px"
  src="https://cloud.githubusercontent.com/assets/378023/6996305/4d567190-dbbb-11e4-8ae8-4be016a85c68.png"
  srcset="https://cloud.githubusercontent.com/assets/378023/6995981/3d455d76-dba6-11e4-9740-23202591201b.png 544w">

It __tones down__ less important parts (like punctuation and brackets) and highlights only the __important__ ones. This leads to a more calm color scheme, but still lets you find the stuff you're looking for.

<img alt="CSS in DuoTone dark" sizes="780px"
  src="https://cloud.githubusercontent.com/assets/378023/6996868/871b6440-dbdd-11e4-834e-b28363026d0c.png"
  srcset="https://cloud.githubusercontent.com/assets/378023/6996081/4dc96804-dbab-11e4-95f9-cc06a67452cb.png 1560w">

<img alt="HTML in DuoTone dark" sizes="780px"
  src="https://cloud.githubusercontent.com/assets/378023/6996874/aee76b40-dbdd-11e4-95e1-a40258a50c26.png"
  srcset="https://cloud.githubusercontent.com/assets/378023/6996875/b2160e02-dbdd-11e4-913e-7dc006437d94.png 1560w">

<img alt="CSS in DuoTone dark" sizes="780px"
  src="https://cloud.githubusercontent.com/assets/378023/6996868/871b6440-dbdd-11e4-834e-b28363026d0c.png"
  srcset="https://cloud.githubusercontent.com/assets/378023/6996081/4dc96804-dbab-11e4-95f9-cc06a67452cb.png 1560w">


## Install

Search for `tone-dark-syntax` in Atom's settings or install with:

```
apm install tone-dark-syntax
```


## Settings

You can change the color scheme by going to `Settings > Themes > tone-dark-syntax Theme` (or the cog icon next to the theme picker). There you can customize the 3 accent colors.

![Custom Colors](https://cloud.githubusercontent.com/assets/378023/20046592/ccb836fa-a4ee-11e6-8441-816c8e0709c7.png)


## Language support

Why is the language support somewhat sparse? I think in order to decide how a language should be highlighted, you have to understand the language. Only then you can get the nuances right. Therefore this theme only supports a language if somebody actively maintains it.

Language | Extension | Maintainer
--- | --- | ---
CoffeeScript | `.coffee` | :wave: Maintainer needed
CSS | `.css` | [@simurai](https://github.com/simurai)
GF Markdown | `.md` | [@simurai](https://github.com/simurai)
Git Commit Message | `.COMMIT_EDITMSG` | [@simurai](https://github.com/simurai)
HTML | `.html` | [@simurai](https://github.com/simurai)
JavaScript | `.js` | :wave: Maintainer needed
JSON | `.json` | [@simurai](https://github.com/simurai)
Less | `.less` | [@simurai](https://github.com/simurai)
Sass | `.scss` | [@simurai](https://github.com/simurai)
Text | `.txt` | [@simurai](https://github.com/simurai)
Todo | `.txt` | [@simurai](https://github.com/simurai)

Want to contribute? Awesome! Here the steps to add syntax highlighting for a specific language:

1. Add an example file to `spec/`. Doesn't have to be complete, just something to test the highlighting.
2. Add a Less file with the styling to `styles/languages/`.
3. Add an import to that Less file in `styles/languages/_index.less`.
4. Add yourself as the maintainer to this `README.md`.
5. Make a PR. :tada:

> Note: Since there are hundreds (thousands?) of languages out there, only the most commonly used languages will get accepted. :bow:
