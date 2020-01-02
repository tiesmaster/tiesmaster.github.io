---
layout: post
title: "Setting up Developer Blog with Jekyll 07: Integrate with Beautiful Jekyll"
date: "2020-01-02 23:41:19 +0100"
categories: jekyll setup-dev-blog series
---

The last couple of posts were about themes, and it was quite a journey to find a good theme, and get it working. My last results were that Beautiful Jekyll was probably the best candidate for the blog, and it is, as you can see. Or not, if you're reading this in the maybe distant future, and I've switched themes completely ;)

Anyhow, I decided to go with Beautiful Jekyll, and do the non-Gemfile dependency, and copy in all the files of the theme. Actually, I _merged_ in the [`beautiful-jekyll`](https://github.com/daattali/beautiful-jekyll) repository, integrated the changes, and made _my_ changes to get back to how I [personalized](/2019-12-05-personalizing-jekyll/) the site. I did that to make it easier to keep up with the changes in the theme, if there any changes, and relevant for me.

# Integrating with Beautiful Jekyll

It was actually quite some work, since I wanted to make it easier for me to see what I did, not now, but when I would look it up, in the future. The reason is that I know I'm not going to remember exactly what I did to get it to work, and having to weed through all of the changes in a single merge commit is going to feel like hell (I actually tried that approach, just couldn't get the intended diff out of git...).

So what I did, instead, was figured out which files would give me merge conflicts; checked those files from the `beautiful-jekyll` repo, and commited those; did the merge, without conflicts, obviously; and re-applied my changes. This results in [a very clean diff](https://github.com/tiesmaster/tiesmaster.github.io/compare/94c121f...a93f1ab), only the `Gemfile.lock` shows up. Normally, these kind of files don't, however, because it's actually _that_ similar to the previous version that GitHub decides it worth viewing ;)

In the end, it wasn't the easiest approach, but I do think in the long run it's going to pay back. Time will tell.
