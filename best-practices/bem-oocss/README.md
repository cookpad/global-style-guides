# A primer to BEM and OOCSS

We use a combination of BEM and OOCSS to write manageable CSS.
Currently not all CSS have been converted to this style so it's a work in progress!

## BEM

BEM is a guideline for naming classes that prevent mistakenly overriding other classes:

```
.BLOCK{__ELEMENT[--MODIFIER]}
```

- **Block:** Name of a UI component
- **Element:** Parts of a UI component
- **Modifier:** Different states/exceptions


### Example
HTML:

```html
<ul class="tab-list">
  <li class="tab-list__item">Home</li>
  <li class="tab-list__item tab-list__item--active">Users</li>
  <li class="tab-list__item">Posts</li>
</ul>
```


SCSS:
```scss
.tab-list {
  margin: 10px 0;

  &__item {
    display: inline-block;

    &--active {
      background: #EEE;
    }
  }
}
```

**Caveat:** Bootstrap classes don't follow this standard so we accept some inconsistencies when using those :sweat:

## OOCSS and Components

In order to achieve a consistent design and reduce CSS, rather than tying custom CSS to business domain specific classes, we aim to create _reusable components_.

Instead of having:

- "User links"
- "Recipe form"
- "Comment publication date"

We try to have as much as possible of:

- "Tab list"
- "Form with chromeless inputs"
- "Hint text"

When adding styles to something, first consider:

- Do we already have one/several components that can create the effect I want?
- Look at what [bootstrap provides](http://getbootstrap.com/css/)

## Useful links

- http://fullstackradio.com/episodes/1/
- https://mattstauffer.co/blog/organizing-css-oocss-smacss-and-bem
