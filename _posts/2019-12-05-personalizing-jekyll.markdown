---
layout: post
title: "Setting up Developer Blog with Jekyll 03: Personalizing Jekyll"
date: 2019-12-05 23:26:34 +0100
categories: jekyll setup-dev-blog series
---

In [the previous post](/jekyll/setup-dev-blog/series/2019/11/28/what-do-you-get.html), we've explored what the base "footprint" is of a new Jekyll site. One of the most important files to adjust the site to your needs seemed to be the [`_config.yml`](https://jekyllrb.com/docs/configuration/) file. So let's have a look at that file, shall we?

Customizing the site is actually really easy, I only had to [set some properties](https://github.com/tiesmaster/tiesmaster.github.io/commit/fe28c6c) to what I wanted for that (for now), and be done with it.

## Done, right?

So that was actually really easy, except there are a couple loose ends, like some properties in the `_config.yml`, and the [About](/about) that just contains some boilerplate documentation about Jekyll. For the latter, I'll take the easy way out, and just replace the [content with a placeholder "TODO"](https://github.com/tiesmaster/tiesmaster.github.io/commit/9ac5bcc), so I can focus on the missing pieces in the `_config.yml`.

So there are 2 properties in the `_config.yml` that bothers me:

- `baseurl`, and
- `url`

What the hell do I make these, and, _most importantly_, why do these matters?

Looking at the [Jekyll docs](https://jekyllrb.com/docs/configuration/options/) for this, I do see the `baseurl` getting documented, but the `url` is nowhere to be found, on any of the Jekyll documentation about the configuration :(

Of course, these properties have a bit of documentation in the `_config.yml` file itself:

```ruby
baseurl: "" # the subpath of your site, e.g. /blog
url: "" # the base hostname & protocol for your site, e.g. http://example.com
```

So, from the name of the properties, and especially the description is clear what they _mean_, but not _how_ they're interpreted. _When_ do they matter? Is this for `$ jekyll serve`, or for when it's pushed to GitHub. Or maybe both?

## TDD, shall we?

Of course, this puts your understanding, expectations of a system like this _under test_, so in a way, I see this as "test driven development" ;) So let's do some testing. BTW I got this idea from Googling "jekyll url baseurl", but couldn't really anything particular relevant, _at first sight_. However, I did find [this Digital Ocean page](https://www.digitalocean.com/community/tutorials/controlling-urls-and-links-in-jekyll), which describes the _output_ of the static site, generated by Jekyll. That made me realize, you just need to test the system, to see how it behaves. That leads to these _test results_ ;)

### First scenario: `$ jekyll build`

If I change both properties to something like:

```ruby
baseurl: "https://hoi.dag" # the subpath of your site, e.g. /blog
url: "/blog" # the base hostname & protocol for your site, e.g. http://example.com
```

and then generate the site, as GitHub would do on GitHub Pages, then I see these values coming up in my generated site:

```sh
$ rg blog/about _site
_site/about/index.html
12:<link rel="canonical" href="/blog/about/" />
```

So it's clear that Jekyll is using these values into URLs that get generated. What remains as an open question is: should I set the `baseurl` to my domain name? For that, let's have a look at the current state of affairs.

BTW rg is the "best grep tool in the world". See [this article](https://blog.burntsushi.net/ripgrep/) for details. And, yes, of course, your mileage may vary, but it's definitely a good replacement for `grep`.

### Second scenario: Current state of affairs

Looking at the current deployed version of the site, I see that the current link to the about page is:

```html
<a class="page-link" href="/about/">About</a>
```

So, we just get _relative_ URLs, excluding the hostname, and assuming the site is on the root of the domain. This looks to _serve_ us quite well. Let's look at the final scenario.

### Third scenario: `$ jekyll serve`

If I serve the page during development, then I _just_ get a non-functional site, since it concatenates the `url` to the localhost serving like this: `http://127.0.0.1:4000https://hoi.dag/`. Which is clearly not what you want in this case.

If I _only_ set the `url`, then the site is still served from the "naked" domain, so that doesn't change anything. I think you'd use that when you run your site on a path like '/blog', where you want the relative paths to contain that, but have a very simple development experience, where that portion is left out.

## TL;DR

In your most common day scenario, you don't need to consider these properties, and just leave them blank ;)
