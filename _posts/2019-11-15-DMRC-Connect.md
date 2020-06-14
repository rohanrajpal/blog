---
layout: post
title:  "DMRC Connect: Improve your daily commute"
date:   2019-11-15 16:00:00 +0530
comments: true
categories: Mobile
image: images/previews/dmrc-connect.jpg
hifed-photo:
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/1.png"
    image_path: "images/DMRC/hi-fed/1.png"
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/2.png"
    image_path: "images/DMRC/hi-fed/2.png"
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/3.png"
    image_path: "images/DMRC/hi-fed/3.png"
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/4.png"
    image_path: "images/DMRC/hi-fed/4.png"
    end_row: "true"
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/5.png"
    image_path: "images/DMRC/hi-fed/5.png"
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/6.png"
    image_path: "images/DMRC/hi-fed/6.png"
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/7.png"
    image_path: "images/DMRC/hi-fed/7.png"
  - aspect: "0.4"
    url: "images/DMRC/hi-fed/8.png"
    image_path: "images/DMRC/hi-fed/8.png"

finalapp-photo:
  - aspect: "0.4"
    url: "/images/DMRC/final-app/1.webp"
    image_path: "/images/DMRC/final-app/1.webp"
  - aspect: "0.4"
    url: "/images/DMRC/final-app/2.webp"
    image_path: "/images/DMRC/final-app/2.webp"
  - aspect: "0.4"
    url: "/images/DMRC/final-app/3.webp"
    image_path: "/images/DMRC/final-app/3.webp"
    end_row: "true"
  - aspect: "0.32"
    url: "/images/DMRC/final-app/4.webp"
    image_path: "/images/DMRC/final-app/4.webp"
  - aspect: "0.32"
    url: "/images/DMRC/final-app/5.webp"
    image_path: "/images/DMRC/final-app/5.webp"

media-coverage:
  - aspect: "0.4"
    url: "https://www.hindustantimes.com/education/students-of-iiit-delhi-showcase-18-innovative-projects/story-91oReLsp2VlGLlJBfTJ5jL.html"
    image_path: "/images/DMRC/media/hindustantimes.png"
  - aspect: "0.4"
    url: "https://www.bhaskar.com/delhi/delhi-ncr/news/increase-taste-with-food-sharing-twitter-clumsy-also-stay-updated-with-dmrc-01688839.html"
    image_path: "/images/DMRC/media/dainikbhaskar.png"
  - aspect: "0.4"
    url: "https://www.latestly.com/agency-news/students-of-iiit-delhi-showcase-innovative-projects-1340276.html"
    image_path: "/images/DMRC/media/latestly.png"
    end_row: "true"
  - aspect: "0.32"
    url: "https://www.internationalnewsandviews.com/iiit-delhi-students-showcase-innovative-projects-at-bbi/"
    image_path: "/images/DMRC/media/intnews.png"
  - aspect: "0.32"
    url: "https://www.indiatvnews.com/news/india/iiit-delhi-students-delhi-metro-live-tracking-innovative-projects-564087"
    image_path: "/images/DMRC/media/indiatv.png"
---

From July-November 2019, my team and I worked on an application. This project was a part of the course: CSE501-Designing Human-Centered Systems.

<div class="dmrc-container">
  <img class="dmrc-logo" src="{{ site.baseurl }}/images/DMRC/logo.png">  <br>
  DMRC-Connect
</div>

## Media Coverage
We were glad that our project was covered by various news channels. Click on any of the images below to read more:

{% include flexgallery id="media-coverage" caption="Our project featured in news"%}

## Motivation
The metro has been the backbone of transport in Delhi NCR, with daily ridership in excess of 5 million riders. It is famous for providing world-class transit with reach to almost all corners of the city with a reputation of punctuality and quality. At the core of these values lie the vision and mission of DMRC that aim to have the best possible experience for riders from all walks of life and have that with trust and reliability.

DMRC has always tried to take an extra step ahead to connect better with the riders and provide them with the best experience. Social media plays an important role in their endeavour to build this connection, with DMRC being active on all social media platforms and constantly engaging with the riders.  

{% twitter https://twitter.com/OfficialDMRC/status/1158191977617227776?s=20 %}
{% twitter https://twitter.com/OfficialDMRC/status/1271368741285060608?s=20 %}

However, the question remains, do all Delhi metro users really use Twitter? While DMRC is putting in full efforts to relay this information to riders, is it really reaching the intended audience? Are complaints being solved fast enough for affected riders to benefit from it? Do all complaints be it from Twitter, or from their helplines come with complete information?

Unfortunately, a general trend after rolling out small surveys and talking to users at various metro stations and in and around Delhi, we got to know that this wasn't the case. Not only was social media outreach restricted to those who followed DMRC on Twitter, but this sort of engagement also was never advertised or encouraged by any official metro source.  

## Problem Statement

### What does DMRC Connect do? 
We create an application that facilitates interaction between DMRC officials and DMRC users and bridges the gap created earlier due to less outreach.

### What are the features?

Sticking to the theme of the user and official interaction, the features of DMRC Connect are:
1. Announcements
2. Complaint registration
3. Complaint tracking
4. Quick access helplines
5. FAQs

## The Design Process

### Contextual Enquiry
To help understand the problem better and get the user's perspective on it, we set out to interview general metro users about their usage patterns and general behaviour when it comes to complaints. Our aim was to understand the kind of behaviour users have while interacting with current systems and understand whether the current modes of communication were effective or not.

The target audience was any general rider of the metro who was not a minor, and questions ranged from general ones that helped us understand their general behaviour towards tackling issues they faced, to more specific ones that asked the user about their experiences specific to the metro.

A few of the questions were:
1. How often do you face "issues" or "problems" in services offered to you? It could be in an app, it could be during transportation like railway/metro/bus, it could be college or conferences?
2. Have you ever come across official announcements from Delhi metro? Where did you hear about them?
3. What problems have you faced in the metro till now? Can you describe any one instance? 

![lofi]({{ site.baseurl }}/images/DMRC/affinity_diagram.jpg)

### Lo-Fidelity Prototypes

Based on the affinity mapping, we came up with the initial paper prototypes of our application and took them to users for testing through Task Analysis.

![lofi]({{ site.baseurl }}/images/DMRC/lofi-prototypes.jpg)

Key Findings from v0 and v1:
1. Users went to "Help Centre" to do most tasks related to getting help from DMRC, very few users went to the actual intended target location.
2. "Contact Us" seemed to be a way to contact the developers rather than DMRC helplines.
3. Some people went to the complaint section in v2 to find women's helpline.
4. In helplines, instead of direct calls, users wanted phone numbers to pop-up instead.

### Hi-Fidelity Prototypes

After 3 iterations of user testing through Task analysis on the lo-fidelity prototypes, we arrived at the first version of the hi-fidelity prototype and conducted testing on it.  

{% include flexgallery id="hifed-photo" caption="High Fidelity prototypes"%}

One of the major changes after user testing on the Hi-Fidelity prototype was to change the colour scheme to one with less hue, i.e primarily blue-based instead of red-based, and to shift from side navigation to bottom navigation instead.

### Final Color Scheme and Typography

The typography used throughout was Roboto, as it is standardly used by Google and the colour scheme is mentioned below.

<img class="dmrc-colorscheme" src="{{ site.baseurl }}/images/DMRC/color-scheme.jpg">

### Final Application

The final application, made with help of Android Studio and a Flask backend, was made live on the play store for users to use. The application is available [here](https://bit.ly/2NVhIEV). However, due to lack of resources, we have closed the backend for now.

{% include flexgallery id="finalapp-photo" caption="The final application"%}

## DMRC Connect is now Open Source!

We have released the source code on github. Feel free to clone and play around with it!
<https://github.com/gupta-meghna64/DMRC-Connect>

## Building Better Interfaces #BBI2019 

<div class="dmrc-container">
  <img class="dmrc-group-pic" src="{{ site.baseurl }}/images/DMRC/BBI/them-bois.jpg">
  
  <img class="dmrc-station" src="{{ site.baseurl }}/images/DMRC/BBI/bbi-station.jpg">
  <img class="dmrc-prop" src="{{ site.baseurl }}/images/DMRC/BBI/bbi-mainprop.jpg">

  <img class="dmrc-director" src="{{ site.baseurl }}/images/DMRC/BBI/director.jpg">

  <img class="dmrc-with-pk" src="{{ site.baseurl }}/images/DMRC/BBI/with-pk.jpg">
</div>

## Team members

- Rohan Rajpal <https://github.com/rohanrajpal>
- Meghna Gupta <https://github.com/gupta-meghna64>
- Saatvik Jain <https://github.com/saatvikj>
- Tanya Gupta <https://github.com/Tanya16107>
- Siddharth Yadav <https://github.com/sedflix>