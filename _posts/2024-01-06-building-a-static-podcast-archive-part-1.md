---
title: "Building a static podcast archive: Part 1"
date: 2024-01-06
description: "Like many other folks working for tech startups, I was laid-off in the final months of 2023. This lead to some extra time for side-projects and seemed like a good opportunity to archive Station Zed; keeping it online and cutting down on recurring costs."
layout: post
category: work
---

If you’re only interested in the technical process, consider skipping the context up front and starting at [“Working with the RSS feed”](#working-with-the-rss-feed).

**Note:** At the time of writing this, the links to our old site(s) are all still alive. Seeing as the plan is to sunset these at some point, however, that may no longer be the case when you’re reading this. Sorry!

## Little ditty ‘bout Jake, Pat, and Stephen

A few years back, a couple of friends (Jake and Pat) and I setup a podcast called **The Dust Off**. It was a lot of fun, but the technical side at the time was still fairly involved if you didn’t have a big budget or network affiliation. The original version of [thedustoff.com](http://thedustoff.com) was cobbled together using a handful of **WordPress** plugins to update and generate the RSS feed, **SoundCloud** to store and serve the files, redirect tools like **PodTrac** to keep an eye on our numbers, and a whole lot of manual work for tagging, uploading, and cross-linking.

### Birth of a station

As **The Dust Off** grew and started to find an audience, some friends took an interest in starting their own shows too. Since we already had the technical infrastructure and were paying for **DreamHost** for hosting the site(s) and **SoundCloud** for the files, it made sense to help them out. Before long, this lead to the formation of **Station Zed**, ([stationzed.com](https://www.stationzed.com)) our collaborative podcast network with a goal of helping other creative folks get up and running on no budget. At it’s peak in 2018, **Station Zed** was the home of four distinct shows:

- [**The Dust Off** (2016-18)](http://thedustoff.com/series/thedustoff/) - a show about revisiting movies, shows, games, and other things that held meaning to the hosts over the years
- [**Wrestle Daddies** (2017-18)](https://www.stationzed.com/wrestle-daddies/) - an indie wrestling federation run by two bonkers promoters who develop and track the careers of fictional wrestlers with whacky schticks
- [**Springfield: The Later Years** (2018-19)](https://www.stationzed.com/springfield-the-later-years/) - a view-and-review of episodes from the maligned later seasons of The Simpsons by two big fans of the best years of the show
- [**Boozing & Bonding** (2018-21)](https://www.stationzed.com/boozing-and-bonding/) - a tour through classic Bond movies and hand-picked cocktails and drinks paired with each one

We all had a blast introducing season-long plot lines, big twists, and eccentric guests across the Station Zed shows. Everyone involved appeared as guests on the other shows - either as themselves or some strange character. It was a lot of fun.

### Death of a network

After some time, however, the scheduling, promotion, manual effort, and costs started carving away at the enjoyment of it all. One by one, the shows wound down and the dream of **Station Zed** was gone, like tears in rain.

Admittedly, that was a bit dramatic. I just love working-in Roy Batty’s speech at any possible opportunity. **Station Zed** didn’t actually go anywhere, to be fair. The original domain has been live since it launched and all show posts and feeds have remained online. Costs were adding up, however, for a network infrastructure that was no longer actively in use. First to drop was **SoundCloud**, with the “Pro” subscription being cancelled. Unfortunately, this lead to the service hiding most of our backlog of episodes, meaning the MP3s were no longer accessible and listeners had no way of hearing our previous work.

Around the same time, the **WordPress** sites and databases were shifted over to **Digital Ocean** to save hosting costs. Additional **Digital Ocean** buckets were also setup to serve the audio files, though this required manual updating of episode posts and file redirects. Unfortunately, the **Digital Ocean** approach has come with many issues around traffic overages and **MySQL** database crashes. Not the most stable environment.

Things have mostly been in this state since 2020-21, as **Boozing & Bonding** sobered up and released their final few episodes.

## Starting at the bottom

Like many other folks working for tech startups, I was laid-off in the final months of 2023. While I had some freelance lined up to keep me afloat, this change of employment did lead to some extra time for side-projects. Archiving **The Dust Off** and **Station Zed** to keep it all online and cut down on recurring costs has been a back-burner goal for some time now, and this seemed like a good opportunity.

Unfortunately, when I visited the live site(s) to download episodes, it turned out that our de-subscribing from **SoundCloud** and partial shift in file hosting to **Digital Ocean** wound up leaving most episodes of each show still unavailable.

Thanks to our RSS configuration, however, the XML feed files were still alive and well. This is where the archiving effort started.

### Working with the RSS feed

#### Consuming XML directly

The first step was to download the original RSS feed as XML file(s) from both **The Dust Off** and **Station Zed**. Because **The Dust Off** launched before the network, it has always lived on its own separate domain. The other shows were all hosted directly from **Station Zed**.

At the time of writing this, both domains are still up and running. You can find the respective XML-based RSS feeds at the following addresses:

- [**The Dust Off**’s dedicated RSS](http://thedustoff.com/feed/podcast)
- [**Station Zed**’s network RSS](https://www.stationzed.com/feed/podcast)

I started the process with a prototype using only **The Dust Off**, which I’ve left unfinished on [**GitHub**](https://github.com/stephenbelyea/thedustoff/tree/main). This initial version directly consumed the XML file as the data-source to feed the static site’s front end. Due to the dead file paths and old domain links throughout the RSS entries, this quickly became a cumbersome process of [manually searching out and updating content in the feed file](https://github.com/stephenbelyea/thedustoff/commit/5b6642c82e50df227d8d5775034d35c752f6e647).

In short, this didn’t feel like a simple, sustainable solution. Especially when the [initial approach of linking to MP3 files shared from **DropBox**](https://github.com/stephenbelyea/thedustoff/commit/57e0cf24b1406a8b0b8f78351a955e469165dde2) wound up causing traffic issues and blocked access - not to mention reliance on **TinyUrl** and other URL shorteners to get around invalid characters in the **DropBox** URLs when parsed as XML.

On the other hand, this initial prototype did offer a helpful start at [parsing the XML feed and appending to the site’s DOM structure using JS](https://github.com/stephenbelyea/thedustoff/blob/main/docs/script.js) without additional plugins or libraries. So, that was a plus!

#### Parsing XML to build JSON

Given the progress made and stuff learned with the specific **The Dust Off** prototype, I opted to open a new repo and start fresh on the full **Station Zed** archive. I knew that our source RSS feed data would need to be updated for file paths, links, and other info as things developed, so I shifted the purpose of [the XML feed files](https://github.com/stephenbelyea/stationzed/tree/main/scripts/xml-feeds) to serve only as original basis - rather than active source-of-truth.

I like working with JSON, so I opted to use that as the new data format for our episode feeds. This kicked off with a fairly simple Node parser built using the XmlToJs library to [structure a simpler content model and spit out the new files](https://github.com/stephenbelyea/stationzed/commit/0d8788a22b7e55e925536f696bfa2ea504777519).

```js
const getFeedSingleItem = (singleItem, index) => {
  const {
    title, link, pubDate, description, enclosure, ...item
  } = singleItem;

  const linkParts = link[0].split(“/“).filter((part) => part !== “”);
  const idFromLink = linkParts[linkParts.length - 1];

  const dateObj = new Date(pubDate[0]);
  const formattedDate = new Intl.DateTimeFormat(“en-CA”, {
    year: “numeric”,
    month: “long”,
    day: “numeric”,
  }).format(dateObj);

  return {
    title: title[0],
    id: idFromLink,
    date: formattedDate,
    summary: description[0],
    fileUrl: enclosure[0][“$”].url,
    fileType: enclosure[0][“$”].type,
    show: item[“itunes:author”][0],
    duration: item[“itunes:duration”][0],
    explicit: item[“itunes:explicit”][0],
    keywords: item[“itunes:keywords”][0],
    content: item[“content:encoded”][0],
    imageUrl: item[“itunes:image”][0][“$”].href,
  };
};
```

This approach also made it easy to split each episode’s URL and store an ID based on the post slug generated by **WordPress**. Due to the consistent and reliable slugs, this wound up being a key piece of info for working with each episode moving forward.

Since **The Dust Off** domain (and RSS feed) had a single-series configuration and publishing process that differed from **Station Zed**’s multiple shows, some tweaks were needed to ensure [each show was grabbing the correct feed data for the JSON model](https://github.com/stephenbelyea/stationzed/commit/2fd21266359498d3cfec3ab88e7ab4f98f2b8c66).

At this point, the original XML had provided vital in building our transformed data, but could now be left safely behind.

---

We’ll keep this walkthrough going in Part 2 - which will be much more technical focused and less about the back-story. Keep an eye out for it!
