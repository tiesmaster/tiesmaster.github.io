---
layout: post
title: "Setting up Developer Blog with Jekyll 02: What do you get?"
date: 2019-11-29 00:12:23 +0100
categories: jekyll setup-dev-blog series
---

So the next post was going to be: "Personalizing Jekyll". However, I realized, it's good to check-out what you actually get when you do: `$ jekyll new`. It's not much, but there is a certain structure, there's a config file, etc. This also helps when we get to themes, since that mixes things up badly ;)

This actually begs the question: What is Jekyll anyhow? And how does it related to GitHub Pages?

# GitHub Pages

Let's start from the bottom: [GitHub Pages](https://help.github.com/en/github/working-with-github-pages/about-github-pages). As I see it, you basically get:

- "static content" hosting,
- for free, from GitHub ([to a certain extend](https://help.github.com/en/github/working-with-github-pages/about-github-pages#usage-limits)),
- SSL enabled,
- in a developer friendly manor.

So instead of FTP'ing stuff over to a web server, like in the old days, you can easily commit your HTML, and push it GitHub. When you do that, then minutes later, GitHub will have caught up, and will be serving your site on your `***.github.io` domain. They have support for custom domains, personal `404` pages, and, most importantly: Jekyll.

# Jekyll

So that brings us to the next question: what does Jekyll bring to the table? In a nutshell, crudely said: it allows you to write your HTML as Markdown. That simplifies things maybe a little bit too much, but what Jekyll basically does is, it will take your site, "pre-process" it, and output your site as pure HTML, which can then be served by a _static_ web server, like GitHub Pages. Which makes a site like that very cheap to run.

Jekyll also does some other stuff, like adding headers, and footers, has theme support. But most importantly, it's also "blog-aware", [as they call it theirselves](https://jekyllrb.com/):

> Permalinks, categories, pages, posts, and custom layouts are all first-class citizens here.

Although, eventually, it's nothing more then an utility that takes a "Jekyll site" as input, and outputs an HTML site. It does come with some additional commands, as you can expect from a mature OSS project like Jekyll, like:

- serving the site, and doing the "static site generation" on the fly,
- diagnosing your site for errors,
- generating a new site.

This brings us to core of this post. What do you really get when you generate a new site.

# `$ jekyll new`

When you run `$ jekyll new`, it simply generates a new site, based on the built-in template. You might be able to install additional templates, I'll explore that in a future post, but for now, the built-in template is the focus of this post. Finally, it's time to inspect what your really get:

```shell
$ tree .
.
├── 404.html
├── Gemfile
├── Gemfile.lock
├── _config.yml
├── _posts
│   └── 2019-11-20-welcome-to-jekyll.markdown
├── about.md
└── index.md

1 directory, 7 files
```

Let's go over these files, one-by-one, in a logical order:

- `Gemfile` // `Gemfile.lock`
  - If you're familiar with Ruby, then recognize these files immediately: yes, indeed, Jekyll is written in Ruby. Shouldn't come as a surprise, since GitHub is also written (largely) in Ruby, and, guess what: [Jekyll was created by GitHub](http://tom.preston-werner.com/2008/11/17/blogging-like-a-hacker.html) ;)
  - The lockfile reveals a _whopping_ 63 gems (packages, if you come from npm, or NuGet), but the `Gemfile` basically boils down to what you see below (_comments / platform specific stuff / perf hacks removed_)
  - You see that's it's basically Jekyll itself as dependency (which is kinda odd to me, but I'll investigate that later ;)), the theme, which also comes as a package, apparently, and support for using plugins (why that needs to put in a "group block", I'm not sure...).

```ruby
gem "jekyll", "~> 3.8.6"
gem "minima", "~> 2.0"
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.6"
end
```

- `_config.yml`
  - This is the main configuration file, this allows you to set the title of the site, user information, the theme, and many more options. In the next post, when I will personalize, and customize the site, then I'll explore this in great detail ;)
- `index.md`, `about.md`, `404.html`
  - These are "regular" web pages (like the front page, the about page, etc.), but written in Markdown, and Jekyll will convert them to HTML, when it generates the site. These files contain ["front matter"](https://jekyllrb.com/docs/front-matter/) to specify certain things that Jekyll will use to generate the full HTML page, things like the title, which template it should use to generate the HTML (the `layout` variable).
- `_posts/2019-11-20-welcome-to-jekyll.markdown`
  - These are the blog posts of the blog. You'll put your posts in there, and Jekyll will automagically generate the front page listing of all your posts, generate a RSS feed, etc. You also see that the path to this post is not `_posts/...`, but `/jekyll/setup-dev-blog/series/2019/11/29/what-do-you-get.html`. The first things in the path are the categories I set on this post, the numbers are obviously the date of the post.
  - This shows that Jekyll does _some_ magic in processing the posts of the site. I'm quite sure that this behavior can be configured, extended, and what not ;)

All in all, the site, out-of-the-box is not even that complicated. Let's see how easy it is to configure the site to your needs.

# Sidebar

I didn't go into the part where you push your Markdown to GitHub, and HTML comes out on the `github.io` side. As you can expect, GitHub implicitly runs jeyll on push ([which is something you do need to enable](https://help.github.com/en/github/working-with-github-pages/creating-a-github-pages-site)). Of course, this is something you can also _easily_ do with a CI/CD pipeline (and not pick Jekyll, but a completely different static-site generator, there are plenty out there). With GitHub Actions, these days, it's even easier to do this.

However, GitHub makes it really easy to do this, without any effort on your side, which makes GitHub Pages/Jekyll really appealing. My biggest question I have right now: how easy/discoverable are errors when things break, go sideways. In a case like that, explicit publishing might become really appealing again ;)
