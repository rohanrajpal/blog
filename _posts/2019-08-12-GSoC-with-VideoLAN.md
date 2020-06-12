---
layout: post
title:  "My GSoC experience with VideoLAN"
date:   2019-08-12 13:00:00 +0530
categories: GSoC
comments: true
driveId: 1HChkHipXaNVgkkA8ZMF5IMyHLtQv3N20/preview
---
## Introduction ![videolan]({{ site.baseurl }}/images/videoLANLogo.png)
This summer, I participated as a [Google Summer of Code](https://summerofcode.withgoogle.com/) student under VideoLAN. GSoC is undoubtedly one of the best summer programs out there. From designing interfaces and interactions to writing production-level code, I've learned tons of exciting stuff!  
I was blessed to have great mentors and learned a lot about the open-source community.  

### Project and Proposal

The VLC media player has an Editor which enables you to customize the player controlbar UI; you can arrange buttons like the play button as per your liking. My main task was to implement this Editor functionality in the new UI for VLC.  

You can have a look at my [project page](https://summerofcode.withgoogle.com/projects/#5519642150305792) on the GSoC website. Feel free to check out my [proposal.](https://docs.google.com/document/d/1h6ABFFuIs7gJh4_zwkN23aYkeuDNsn3GkMUPgzeB7OI/edit)  

### Patches

I made an account on [VideoLAN's Gitlab](code.videolan.org) and worked on [this](https://code.videolan.org/rohanrajpal/vlc-qml) repository. I used to push all my commits there to get them reviewed. Then made patches out of them and sent commits to the VLC-developer mailing list. A few other people would then review the patches. Finally, after making the required changes, the patches would get merged.

<span style="font-size: 14pt">
[Here](https://patches.videolan.org/project/vlc-devel/list/?submitter=908&state=*) is a list of all my patches.
</span>
## The Team

A big thanks to the team and my mentors who helped me with my endless doubts!

* [Abel Tesfaye](https://code.videolan.org/AbelTesfaye) (GSoC Student)
* [Sagar Kohli](https://mail.google.com/mail/u/0/?view=cm&fs=1&tf=1&source=mailto&to=kohli.sagar2@gmail.com) (GSoC Student)
* [Jean-Baptiste Kempf](https://code.videolan.org/jbk) (VideoLAN president)
* [Pierre Lamot](https://code.videolan.org/chub) (Software engineer at Videolabs)
* [Alexandre Janniaux](https://code.videolan.org/alexandre-janniaux) (Software engineer at Videolabs)
* [Rohan Rajpal](https://code.videolan.org/rohanrajpal) (Me)

Our communication was mainly via emails and #vlc-gsoc on IRC.

## The Project

### What work was done?

I had made some contributions towards the player controlbar and further wanted to work on it. Jean then suggested I should work on the Editor. Making the Editor was a big task to do, we divided it into the following parts:   

 1. Create a model of all the buttons/widgets on the player ControlBar. 
 2. Load the player buttons from the model instead of hardcoding them.
 3. Make a simple drag and drop interface which changes the model by dragging and dropping and updates the config
 5. Make a View from which you can drag and add buttons to the player ControlBar.
 6. Add profiles combobox via which you can load, make and delete configurations for the player.
 7. Populate the miniplayer from the model
 8. Make miniplayer editable and add a tab for it in the editor

I have also worked on a few other things

 1. Add all the missing buttons and widgets. I've added the following:  
	 - Volume Widget  
	 ![volume]({{ site.baseurl }}/images/volumeDemo.gif)
	 - Teletext Widget  
	 ![teletext]({{ site.baseurl }}/images/teletextPopup.png)
	 - Aspect Ratio widget  
	 ![aspect]({{ site.baseurl }}/images/aspectRatioWidget.png)
	 - Record button
	 - Spacer widget
	 - Extended Spacer widget
	 - FullScreen button
	 - Record button
	 - AB Loop button
	 - Snapshot button
	 - Stop button
	 - Media Info button
	 - Frame by frame button
	 - Faster button
	 - Slower button
	 - Open media button
	 - Extended settings button
	 - Step forward button
	 - Step backward button
	 - Quit button
 2. Create a topbar for non editable buttons
 ![topBar]({{ site.baseurl }}/images/topBar.png)

### What's left to do?

Although I completed every task I was assigned, below-mentioned tasks are best suited as a follow-up for my work done:

 1. If too many widgets come on one side the center buttons don't remain in the center anymore. This has to be fixed.  
 2. The design of the Teletext and a few other widgets isn't final and work needs to be done.   

## Demo  
Have a look on how the VLC Editor works below:
{% include googleDrivePlayer.html id=page.driveId %}  

## Highlights and Challenges  

### Make a generic player controlbar  

The first task was to make a model that had all the button and widget data. Then I had to use that model to populate the player ControlBar. Loaders are quite helpful when you have to load a component in QML.
{% highlight cpp %}
Loader {
       id: myLoader
       source: "MyItem.qml"
    }
{% endhighlight %}

After making the buttons model. The next step was to make a QtAbstractListModel to maintain a list of the buttons in current config. This is how the player ControlBar is populated now:  
- The model would load the config from VLC Core API.
- The player controlbar model would then add the respective buttons to the list.
- The main controlbar would then use this model to get the list and ids which would then load the button from the buttons model.

### Make sure VLC is accessible via keyboard  

One had to make sure that VLC is easily useable via the Keyboard as well. KeyNavigation and Focuscope are the critical things you'll work with when you are working with Focus.  

With a lot of documentation reading, experimenting, and Pierre's help, I successfully got the KeyNavigation right.

### Drag and Drop

We all use drag and drop interfaces quite frequently. Making such interfaces made me understand the design and the logic behind it.  

To make an item draggable, you have to set it as a drag target. Similarly, to make it possible to drop a draggable, you need to declare a DropArea.

I also had to add functionalities like move, insert and delete to the model, because Drag and Drop involve all these actions.  
Have a look at some of the actions below:  
![]({{ site.baseurl }}/images/DNDDemo.gif)

The next task was to code the cancel and close buttons. The player controlbar should only be updated when the user presses the close button. To implement this, I used signals.  

When you press the close button, the toolbarConfUpdated signal emits, and the playerControlBar is updated.  

[Signals and Slots](https://doc.qt.io/archives/qt-4.8/signalsandslots.html) are used for communication between objects in Qt. Here's the signal sent when toolbar is updated:  
{% highlight cpp %}
if( toolbarEditor->exec() == QDialog::Accepted )
    emit toolBarConfUpdated();
{% endhighlight %}

### Hinting the user
For the user to easily use the drag and drop interface, we have to provide some hints.  
When you hover over a draggable item, the cursor changes to an open hand cursor. If you click and hold over it, the cursor changes to a closed hand cursor.  
![]({{ site.baseurl }}/images/cursorShape.jpg)  
The cursor changes to ForbiddenCursor if you take the draggable to a place where it's not possible to drop.


### Profiles
Profiles help someone easily save their preferences. For this, I kept the configs of both the player and the mini-player controlbar and split them using a delimiter.
![]({{ site.baseurl }}/images/profileDemo.gif)

### Different parts of the Editor
One interesting thing about this editor is that it is a mix of QML and Qt/C++. The window, profiles section and action buttons are coded in Qt. The whole drag and drop part is in QML.

Why use Qt when all can be done in QML? Because:
- qml takes more  ram  
- qml accessibility is hard to get   
- qml is harder to debug, and helps doing some big qml files, which we want to avoid at all cost.

The picture below shows the division.
![Alt Text]({{ site.baseurl }}/images/EditorDivision.png)

### Things I learned
 - Git
	 - [Tricks](https://fle.github.io/git-tip-keep-your-branch-clean-with-fixup-and-autosquash.html) like fixup and autosquash help a lot in keeping the commits clean.
	 - Rebase and reset is quite helpful when you need to edit or rearrange commits.
	 - How to work with patches, send emails from git directly.
	 - Handling merge conflicts like a pro.
	 - How to split commits? A nice trick is if the commit message has bullet points, it can further be split.
 - Code
	 - Avoid writing [over-engineered](https://www.youtube.com/watch?v=-AQfQFcXac8) code
	 - How to work on a huge codebase. Things like Memory leaks, ram consumption, learned how to use the VLC Core API.
	 - Design patterns like the [D-pointer strategy](https://wiki.qt.io/D-Pointer)  and [Model View Delegate](https://doc.qt.io/qt-5/qtquick-modelviewsdata-modelview.html).
	 - Qt/C++, QML and writing production-level code in them.
	 - QtCreator, one of the best IDEs I've used.
 - Design
	 - Learned design concepts like form follows the flow.
	 - Prototyping, brainstorming on interactions.
	 - Clipping
	 - Thinking design solutions keeping the code in mind.