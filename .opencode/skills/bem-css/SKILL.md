---
name: bem-css
description: Apply the BEM (Block, Element, Modifier) methodology to name CSS classes and structure HTML/CSS in a consistent, scalable, low-specificity way.
license: CC-BY-4.0
compatibility: opencode
metadata:
  domain: css
  topic: bem
  audience: frontend
  output: html-css
---

## What I do

- Convert existing HTML/CSS to BEM with minimal disruption.
- Propose clear Block, Element, and Modifier names that describe purpose and state.
- Reduce CSS coupling by lowering selector specificity and avoiding structure-dependent selectors.
- Identify common BEM anti-patterns and provide fixes (e.g., “elements of elements”, modifiers used without the base class, styling external geometry inside the block when it should live in the parent context).
- Provide copy-pasteable HTML and CSS snippets aligned with the chosen naming convention.

## When to use me

Use this skill when:
- You are creating/refactoring UI components and want predictable, reusable styles.
- Your CSS is becoming hard to maintain due to cascade conflicts or high specificity.
- You want to standardize naming for teams and long-lived codebases.

## Core BEM concepts I will enforce

1) Block
A standalone, reusable entity that is meaningful on its own (component).
Examples: `button`, `card`, `nav`, `search-form`.

2) Element
A part of a block with no standalone meaning; semantically tied to its block.
Examples: `search-form__input`, `card__title`, `nav__item`.

3) Modifier
A flag that changes appearance, state, or behavior of a block or element.
Examples: `button--disabled`, `card--featured`, `nav__item--active`.

4) Mix (composition)
When you need shared formatting/behavior across different entities, I will prefer composition (adding another class) rather than writing coupling selectors across blocks.

5) No “elements of elements”
I will not create names like `block__elem1__elem2`. If deeper structure is needed, I will either:
- Create a new element name at the block level (flat naming), or
- Introduce an additional block and compose via mix.

## Naming conventions (choose one and stay consistent)

I will match the convention already used in your repo. If the repo has no established convention, I will default to the “two dashes” style.

A) Two dashes (commonly used on getbem.com)
- Block: `block`
- Element: `block__element`
- Modifier: `block--modifier` or `block__element--modifier`
- Key-value modifier (when needed): `block--key-value` or `block--key--value`

B) Underscore style (commonly used on en.bem.info)
- Block: `block`
- Element: `block__element`
- Modifier: `block_modifier` or `block_modifier_value`
- Element modifier: `block__element_modifier` or `block__element_modifier_value`

Rule: I will not mix naming styles within the same component set.

## Selector rules I will apply

- Prefer single-class selectors: `.block {}`, `.block__element {}`, `.block--modifier {}`.
- Avoid tag+class selectors and combined selectors when they increase specificity or create coupling.
- Avoid styling based on DOM nesting unless explicitly required.

## Modifier rules I will apply

- Modifiers do not replace the base class. The base class must always be present.
  - Good: `<button class="button button--disabled">`
  - Bad: `<button class="button--disabled">`
- Use modifiers for state/variation, not for unrelated structure.
- Prefer boolean modifiers for toggles and key-value modifiers only when necessary.

## Geometry/positioning rule

External geometry and positioning (spacing, placement) should be controlled by the parent context, typically via:
- An element class in the parent block, or
- A mix class applied at the usage site

I will avoid baking layout spacing into a block when it prevents reuse.

## Decision checklist

- Is this reusable and meaningful alone? → Block
- Is this meaningless outside the component? → Element
- Is this a variation or state? → Modifier
- Do we need shared behavior? → Mix
- Are we creating nested elements of elements? → Redesign

## How I respond

When you ask for BEM help, I will return:

1) Naming map (blocks, elements, modifiers)
2) Updated HTML example
3) Updated CSS example
4) Short rationale

## Example (two dashes)

HTML:
```html
<article class="card card--featured">
  <h2 class="card__title">Title</h2>
  <div class="card__body">...</div>
  <div class="card__actions card__actions--stacked">
    <button class="button">Action</button>
  </div>
</article>
````

CSS:

```css
.card {}
.card__title {}
.card__body {}
.card__actions {}
.card--featured {}
.card__actions--stacked {}
```

## References

* [https://css-tricks.com/bem-101/](https://css-tricks.com/bem-101/)
* [https://en.bem.info/methodology/css/](https://en.bem.info/methodology/css/)
* [https://en.bem.info/methodology/quick-start/](https://en.bem.info/methodology/quick-start/)
* [https://getbem.com/introduction/](https://getbem.com/introduction/)
* [https://getbem.com/naming/](https://getbem.com/naming/)

