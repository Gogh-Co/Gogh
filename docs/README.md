---
permalink: /index.html
---

# Gogh

## DEV Website

### Pre:

- node
- npm
- Gulp

## Start:

- In root repo folder
- Run `npm install`. This will install all dependencies the project needs.
- Run `gulp dev` and start coding .
- Got to `./gh-pages/`
----

## Add theme

- Add preview image in `./images/` folder.
- Go to `./gh-pages/data/themes.js` and add your theme there.

----

To push changes into gh-pages

```bash
$ git subtree push --prefix gh-pages origin gh-pages
```

Delete remote branch

```bash
$ git push origin --delete gh-pages
```
