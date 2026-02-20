---
name: frontend-style-guide
description: Enforce the official HTML, CSS, and Sass style guide exactly as defined by the team documentation (BEM explicitly excluded).
compatibility: opencode
metadata:
  domain: frontend
  topic: style-guide
  audience: developers
---

# Frontend Code Style Guide

> “Every line of code should appear to be written by a single person.”

This skill enforces the **complete HTML, CSS, and Sass style guide** as defined by the team.

---

# HTML

## General Formatting

- Indentation: **4 spaces (no tabs)**
- All tags must include explicit closing tags (team convention, even if optional in HTML5)
- Do not include trailing slashes in self-closing tags
- Always use **double quotes** for attributes
- Do not leave trailing whitespace

## Attribute Order

Attributes must appear in this exact order:

1. `class`
2. `id`, `name`
3. `data-*`
4. `src`, `for`, `type`, `href`, `value`
5. `title`, `alt`
6. `role`, `aria-*`

Example:

```html
<a class="link" id="example" data-toggle="modal" href="#">
    Example
</a>
```

## Boolean Attributes

Boolean attributes must not include values:

```html
<input type="text" disabled>
<input type="checkbox" checked>
<option selected>1</option>
```

---

# CSS / Sass

## Core Rules

- Do not use **IDs** in selectors
- Do not use **HTML tag selectors** (e.g. `div`, `p`, `ul`, `a`)
- Do not use `!important`
- Do not style `.js-*` classes
- Use meaningful structural naming (no presentational names)
- Maximum nesting depth: **3 levels**
- Nesting is only allowed for:
  - pseudo-classes
  - pseudo-elements
  - modifier/state selectors

## Formatting

- Indentation: **2 spaces**
- One declaration per line
- Single space after `:`
- Single space before `{`
- Each declaration must end with `;`
- Remove trailing whitespace
- One selector per line when grouping

Example:

```css
.block,
.block--large {
  display: block;
}
```

## Selector Naming

- Lowercase only
- Hyphen-separated (spinal-case)

```css
.component-name { }
```

## Declaration Order

Declarations must be ordered as follows:

1. Positioning (position, top, right, bottom, left, z-index)
2. Display & box model (display, width, height, margin, padding)
3. Typography (font, font-size, line-height, text-*)
4. Visual (background, border, box-shadow, opacity)
5. Animation (transition, transform)
6. Misc (cursor, overflow, etc.)

## Values

- Use **no units for zero values**
- Use leading zero for decimals (e.g. `0.5`)
- Colors must use variables (no raw hex except in variable definitions)

## Spacing Rule

- `margin-top` is **forbidden**
- Vertical spacing must use:
  - `margin-bottom` on preceding element, or
  - `padding-top` on container

If `margin-top` is detected, it must be removed and replaced accordingly.

---

# Sass Structure

## File Order

1. Imports
2. Variables
3. Base styles
4. Components
5. Header
6. Forms
7. Footer

## Imports

- All `@import` statements must be at the top of the file
- No declarations allowed before imports

## Variables

- Must appear immediately after imports
- Naming:
  - Local variables → `$snake_lowercase`
  - Global constants → `$SNAKE_ALL_CAPS`

## Colors

- All colors must be defined as variables
- Hex values must be lowercase
- Alpha values:
  - Leading zero required
  - Maximum 2 decimal places

---

# Nesting Rules

- Maximum depth: **3**
- Nesting allowed only for:

  - pseudo selectors (`:hover`, `:focus`, etc.)
  - pseudo elements (`::before`, `::after`)
  - modifier/state selectors (`&--active`, `&.is-active`)

Example:

```scss
.block {
  &--mini {
    padding: 12px;
  }
}
```

---

# Media Queries

- Media queries must be defined **inside the selector**

```scss
.selector {
  float: left;

  @media only screen and (max-width: 767px) {
    float: none;
  }
}
```

- Breakpoints must be implemented using mixins

Example:

```scss
@mixin m768 {
  @media (min-width: 767px) {
    @content;
  }
}
```

---

# Skill Behavior

When this skill runs, it must:

- Normalize HTML indentation, quoting, attribute order, and closing tags
- Normalize CSS/Sass formatting and spacing
- Remove all forbidden patterns:
  - ID selectors
  - HTML tag selectors
  - `!important`
  - `.js-*` styling
  - `margin-top`
  - nesting deeper than 3 levels
- Reorder declarations according to the defined property order
- Normalize variable usage and color definitions
- Enforce file structure and Sass ordering rules
- Ensure all output strictly complies with this document