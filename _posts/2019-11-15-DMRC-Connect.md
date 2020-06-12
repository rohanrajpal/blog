---
layout: post
title:  "DMRC Connect"
date:   2019-11-15 16:00:00 +0530
comments: true
---

From July-November 2019, my team and I worked on an application. This project was a part of the course: CSE501-Designing Human Centered Systems.

<div class="container">
  <img class="logo" src="{{ site.baseurl }}/images/DMRC/logo.png">  <br>
  DMRC-Connect
</div>

## Motivation
The metro has been the backbone of transport in Delhi NCR, with daily ridership in excess of 5 million riders. It is famous for providing world-class transit with reach to almost all corners of the city with a reputation of punctuality and quality. At the core of these values lie the vision and mission of DMRC that aim to have the best possible experience for riders from all walks of life and have that with trust and reliability.

DMRC has always tried to take an extra step ahead to connect better with the riders and provide them with the best experience. Social media plays an important role in their endeavour to build this connection, with DMRC being active on all social media platforms and constantly engaging with the riders.  
<div class="container">
  <img class="tweets" src="{{ site.baseurl }}/images/DMRC/6_q_r.png">
  <img class="tweets" src="{{ site.baseurl }}/images/DMRC/7_q_r.png">
</div>

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

<div class="container">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/1.png">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/2.png">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/3.png">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/4.png">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/5.png">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/6.png">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/7.png">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/hi-fed/8.png">
</div>
One of the major changes after user testing on the Hi-Fidelity prototype was to change the colour scheme to one with less hue, i.e primarily blue-based instead of red-based, and to shift from side navigation to bottom navigation instead.

### Final Color Scheme and Typography

The typography used throughout was Roboto, as it is standardly used by Google and the colour scheme is mentioned below.

<img class="colorscheme" src="{{ site.baseurl }}/images/DMRC/color-scheme.jpg">

### Final Application

The final application, made with help of Android Studio and a Flask backend, was made live on the play store for users to use. The application is available [here](https://bit.ly/2NVhIEV).  

<div class="container">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/final-app/1.webp">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/final-app/2.webp">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/final-app/3.webp">
  <br>
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/final-app/4.webp">
  <img class="final-app" src="{{ site.baseurl }}/images/DMRC/final-app/5.webp">
</div>

## Building Better Interfaces #BBI2019 

<div class="container">
  <img class="group-pic" src="{{ site.baseurl }}/images/DMRC/BBI/them-bois.jpg">
  
  <img class="station" src="{{ site.baseurl }}/images/DMRC/BBI/bbi-station.jpg">
  <img class="prop" src="{{ site.baseurl }}/images/DMRC/BBI/bbi-mainprop.jpg">

  <img class="director" src="{{ site.baseurl }}/images/DMRC/BBI/director.jpg">

  <img class="with-pk" src="{{ site.baseurl }}/images/DMRC/BBI/with-pk.jpg">
</div>