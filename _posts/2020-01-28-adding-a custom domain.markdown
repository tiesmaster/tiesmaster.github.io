---
layout: post
title: "Setting up Developer Blog with Jekyll 08: Adding a Custom Domain"
date: 2020-01-28 00:03:22 +0100
categories: jekyll setup-dev-blog series
---

Previously, quite a lot of work went into making the site pretty. It spanned a couple of posts, to [figure out what themes are](/2019-12-23-select-a theme/), [looking into galleries](/2019-12-29-theme-galleries-and-such/), [to eventually going with Beautiful Jekyll](/2020-01-02-integrate-with-beautiful-jekyll/).

Next up, is adding a custom domain for my site. I thought, that this would be a very simple excercise. Just buy a domain, and configure it correctly according to the [docs](https://help.github.com/en/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site). The buying was easy, but when looking into the configuring, I got completely lost with redirects, [subdomains](https://help.github.com/en/github/working-with-github-pages/about-custom-domains-and-github-pages#using-a-subdomain-for-your-github-pages-site), [apex domains](https://help.github.com/en/github/working-with-github-pages/about-custom-domains-and-github-pages#using-an-apex-domain-for-your-github-pages-site), and [`ALIAS`, `ANAME`, and `A` records](https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain). But I'm getting ahead of myself. First, buying!

# Getting a Custom Domain

Of course, getting a custom domain is easy, chances are, that you're already running one or more custom domains. However, in case you're not, and you're wondering which provider you should go for, and most importantly, which not, then read along, otherwise jump to the next section.

Recently, I stumbled upon [Google Domains](https://domains.google/), which caught my attention. You can see it as just another Domain Registrar being done by Google (which might just really scare you away, instead attract). However, I got there through their new [`.dev` TLD](https://get.dev/) that they've launched. Which is awesome, since it's a [top-level preloaded HSTS domain](https://get.dev/#benefits), [meaning that browsers will force HTTPS](https://blog.mozilla.org/security/2012/11/01/preloading-hsts/) _even on the first request_.

Now, I didn't necesssarily had to go through Google Domains, and I actually came across [this post](https://www.troyhunt.com/moving-from-godaddy-to-dnsimple/) from the venerable Troy Hunt, where he explains why you definitely should **not** go with GoDaddy, but rather a service like DNSimple. This post is absolutely hilarious; if you want a laugh, then check it out!

So anyhow, the case for DNSimple was very compelling, however, then I found out how much they costs... Buying the domain is a bit more expensive (\$20 vs € 12), but I'm willing to pay a bit more, if they offer a good service. However, after Googling a bit, and comparing Google Domains with DNSimple, I found out that DNSimple [actually charges you a monthly fee of _at least_ \$5/month](https://dnsimple.com/pricing). So makes it really easy: Google Domains it is!

# Buying the Domain

After the decision, I went ahead and started buying the domain. However, I stumbled upon another weird thing. Google Domains gives a big fat warning somewhere along the process:

> The Google Domains service can only be used for business or commercial reasons in your current country.

It's not really clear what to think of this. This is going to be my _personal_ blog, and I don't have any intentions to make money with this, and after a bit of Googling, I couldn't find anything compelling reason why I can't use this for my personal blog. The only really hit was some bullcrap about ["VAT shenanigans"](https://www.reddit.com/r/webdev/comments/9r4ozt/the_google_domains_service_can_only_be_used_for/).

Next up is configuring GitHub Pages with my new shiny custom domain. I'll leave that for next time, since I know it requires a bit more to get that sorted out...
