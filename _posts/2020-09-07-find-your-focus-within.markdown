---
title: Find your :focus-within
date: 2020-09-07
description: "I love writing CSS. SASS is fun, LESS is (or was?) too, but to me, nothing beats making magic with plain old vanilla CSS. I will happily write to a style.css file any day..."
layout: post
---

I love writing **CSS**. [**SASS** is fun](https://sass-lang.com/), [**LESS** is (or was?) too](http://lesscss.org/), but to me, nothing beats making magic with [plain old vanilla **CSS**](https://www.w3.org/Style/CSS/Overview.en.html). I will happily write to a `style.css` file any day rather than muck around with [**CSS-in-JS**](https://cssinjs.org/?v=v10.4.0) for [component encapsulation](https://styled-components.com/). That quackery is for the birds -- or the full stack devs who are terrified of (or do not understand) the **C** in Cascading Style Sheets (CSS).

Around the time I started as a developer, [**CSS3** was made official](http://amyhissom.com/HTML5-CSS3/history.html#5) and varied support began rolling out across the browser-scape. [**HTML5** was in a similar position](https://mashable.com/2012/07/17/history-html5/), with [polyfils to bridge many of the gaps](https://stackoverflow.com/questions/14429061/html5-shim-vs-shiv). It was a magical time, [with responsive design taking over in a big way](https://alistapart.com/article/responsive-web-design/) and rigid styles using tables or [Flash going up in smoke](https://www.cnn.com/2011/11/09/tech/mobile/flash-steve-jobs/index.html). Sure, we were still a couple of years out from flexbox ([let alone grid](https://alistapart.com/article/the-story-of-css-grid-from-its-creators/)) and plugged our front ends full of absolute positioning and floats ahoy; but at least we were finally looking at the web as a more fluid and flexible place!

![mobile-first responsive web design title with a collection of phones, tablets, and computers that all read 'web' on the screen](/assets/brad-frost-mobile-first.jpg "Brad Frost's illustration of the wide range of devices that can access the web at the head of his [influential \"mobile-first responsive web design\" blog post from 2011](https://bradfrost.com/blog/post/mobile-first-responsive-web-design/)")

I’ve been an avid user of **CSS**’ [pseudo classes](https://css-tricks.com/pseudo-class-selectors/), [sibling selectors](https://css-tricks.com/child-and-sibling-selectors/), and [attribute styling](https://css-tricks.com/almanac/selectors/a/attribute/) since those days. They’ve consistently been a fantastic set of tools for building specificity with flexibility -- and without having to go overboard with classes and IDs. The feeling I get from a nice, clean, **DRY** (Don’t Repeat Yourself) chain of pseudo-sibling-attribute styling to reveal error messages, balance columns, or punch up typography has barely faded over the years. 

Sometimes, like anyone playing with code tricks, I’ll get too clever for my own good and make a less-than-semantic mess. [Reordering an input, label, and error message structure](https://github.com/stephenbelyea/F1yForms/blob/master/src/components/F1yForms/index.js#L69), for instance, to take advantage of the input’s `aria-invalid` attribute for styling the siblings. Or, and this one happens a lot, cramming way too much into a `button` in order to have a nice focus state within a card layout. 

This latter issue came to an abrupt and amazing end for me this week. I found myself on MDN, [my prefered source of documentation for **HTML**, **CSS**, and vanilla **JS**, checking out `button` attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button) for the building of a component. From there, I hopped into [a listing of available pseudo classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes#Index_of_standard_pseudo-classes). That’s when I found it. 

> [**:focus-within**](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus-within)
>
> The :focus-within CSS pseudo-class represents an element that has received focus or contains an element that has received focus. In other words, it represents an element that is itself matched by the :focus pseudo-class or has a descendant that is matched by :focus.

Wait, so there's a way to target a container that "_contains_ an element that has received focus"!?

No longer would I need to fight the visual desire to have a card show a focus state against the semantic value of limiting the block level content of a `button`. No longer would I have to pollute my component logic with `mouseEnter` and `mouseLeave` listeners to pass a class to the parent.

I was blown away! I used it right away in a prototype I was whipping up for HealthHub, and I’ll continue using it until the day I stop touching **CSS**.

![patient communication card with images of common patient requests translated into english and japanese](/assets/patient-com-card.jpg)

For me, there are two key takeaways from finding something like this:

1. **CSS** is still exciting. Learning new tricks still packs a punch and trying them out still keeps me engaged.

2. It never, ever hurts to take a look at documentation. Even if you’ve been doing something one way for years, there’s always a better (or at least different) method out there.

I say “_take a look at documentation_”, because that’s where I found this piece. Sure, I’ve searched CSS Tricks or Stack Overflow for “_how to do x in y_” hundreds (maybe even thousands, by now) of times and found a way to tackle the problem. And that’s great. Blogs (_ahem_, like this one) are great for discovering cool tricks too. But there’s something just so satisfying about double checking documentation and happening upon something you didn’t even know you were looking for. I will happily take a fully functional native method over all the “clever” wizardry in the world any day of the week. 

If you’re feeling unenthused about any element of your work, it never hurts to take a moment to top up your passion. [I’ve written about “inspiration maintenance” before](https://medium.com/@belwerks/inspiration-maintenance-1949f521302c), and even I can frequently forget the value of it. Sometimes it’s a book. Sometimes a conference talk. Sometimes a blog post or LinkedIn share. And sometimes it’s just following an extra “related” link out of curiosity after you’ve already found the documentation you were looking for.
