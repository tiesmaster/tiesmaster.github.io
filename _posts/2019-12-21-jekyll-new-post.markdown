---
layout: post
title: "Setting up Developer Blog with Jekyll 04: Intermission: '$ jekyll new post'"
date: 2019-12-21 20:06:46 +0100
categories: jekyll setup-dev-blog series
---

So previously, I customized the installation, and for this post, I intended to dig into themes. However, I expect that to be quite a post, so I'm going to take an intermission, and focus on automating something that's been annoying for already a bit too much: starting a new post.

# Automate Everything (or not?)

By the way, as most developers, I like to automate things, even the smallest details. Though, over the years I've gotten a bit more pragmatic, so instead of automating a task like creating a new post on the very first moment I'm doing it, I managed to postpone it a couple times. This serves a couple purposes: first, it allows you to first focus on what really important (achieving your goal); secondly, it forces you to go through the pain of the manual steps (no, I'm not a sadist, it rather teaches you _why_ you're really automating it, what you're buying for your efforts); and lastly, it allows you to figure out what you really want, before you automate. Basically, the ["Rule of tree"](<https://en.wikipedia.org/wiki/Rule_of_three_(computer_programming)) which teaches you to defer refactoring away duplication until you have enough data to known where you should refactor towards.

# File -> New Post

What does it really entail to start a new post with Jekyll? So there are [a couple things](https://jekyllrb.com/docs/posts/#creating-posts) you need to do for a new post. For me, that meant for me to copy an existing post, change the file name, update the front matter, and empty the body of the previous post. When I would have automated that straight away, I probably would have made a bash script, or function to create a new file with some default content, since that would have been the easiest way to generate a new post to start working on it, and make sure that the dates, and timestamps are all set to UTC now (or local time now?).

So what did I learn from defering it until now? Well, now, I do this `copy file/update filename/etc` all in VS Code, since that's the editor I use for writing these blog posts. So instead, It might be more fruitful to first checkout what the options are for VS Code. Looking in [https://marketplace.visualstudio.com/vscode](https://marketplace.visualstudio.com/vscode), I see that there are [a bunch of extensions](https://marketplace.visualstudio.com/search?term=jekyll&target=VSCode&category=All%20categories&sortBy=Relevance) for Jekyll. [`jekyll-post`](https://marketplace.visualstudio.com/items?itemName=rohgarg.jekyll-post) seems to be the best candidate to checkout, so I'm going to install that one, and evaluate it in a couple of minutes here ;)

# jekyll-post

Alright, this is already very nice!! As with every VS Code extension, you can install it under seconds, you don't even need to restart VS Code, which is (still) really awesome. `jekyll-post` works straight away out of the box, which I always really like. Making a new post, as described in the [readme](https://github.com/rohgarg/jekyll-post) works as expected. There _are_ a couple things that are a bit annoying:

- you get a bunch of fields in the front matter that I'm not using atm (but you can [configure](https://github.com/rohgarg/jekyll-post#usage-instructions) that, fortunately)
- the date on the front matter is less detailed (no seconds, and no timezone +0X00 thinghy), like [what you get](https://github.com/tiesmaster/tiesmaster.github.io/commit/0d75c98363b62696ce3c872cd47af02c5a23ee75#diff-cc9c48de4f47ecec4b4d7bb1fc81c10dR4) when you do `$ jekyll new`

  - Now, I don't know if you really need it that detailed. If I look at [how the default theme](https://github.com/pages-themes/minimal/blob/02c37764bdbdd7990aa119fdd739f084c1b3d37b/_layouts/post.html#L5) renders the date, then you just get the date: "Dec 21, 2019". However, if I change themes, or something similar, I still want to have this data available, so I definitely want to keep it that way.

- the title of the input box is used for both the filename, as well as, the title in the front matter.
  - The first thing you see there, is that the `.markdown` extention on the file is missing, and next the filename get to contain spaces. Now, _although_, spaces in filenames will still work with Jekyll, however, if I need to do any shell operations on all of my posts, then I'm going to have an hard time in scripting stuff. So also here, I'd want to stick with snake case for the filenames.

So, although, this looks like a disrespectful shitlist on this extension, however, it's not intended like that. I'm already _really_ happy that this extension is created, and put in the Marketplace to be discoverd by me. It's already a whole lot better then I have right now. I _might_ try to make the changes locally in this extension, and load it up in VS Code, and when I've set-up my blog completely, I'll try to contribute the changes back to the author, if he would wants it.

Next up: Themes!
