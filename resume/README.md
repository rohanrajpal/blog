Deedy-Resume-Reversed
=========================

A **one-page**, **two asymmetric column** resume template in **XeTeX** that caters particularly to an **undergraduate Computer Science** student.
As of **v1.3**, a single template is offered:

1. **OpenFonts** - uses free, open-source fonts that resemble the above - *Lato* (and its various variants) and *Raleway*.

It is licensed under the Apache License 2.0.

## Motivation

This fork of the [Deedy-Resume by Deedy](https://github.com/Deedy/Deedy-Resume) was inspired by feedback from /r/resumes and my university career center.  The fonts are a bit heavier and the columns have been reversed to highlight experience first when read in a "Z" pattern.

## Preview

![alt tag](https://raw.githubusercontent.com/ZDTaylor/Deedy-Resume/master/sample-image.png)

## Dependencies

1. Compiles only with **XeTeX** and required **BibTex** for compiling publications and the .bib filetype.

## Availability

1. Just clone this repo or download the fonts folder and the .xtx, .sty, and .bib files.
<!--
2. **Overleaf**.com (formerly **WriteLatex**.com) (v1 fonts/colors changed) - [compilable online](https://www.writelatex.com/templates/deedy-resume/sqdbztjjghvz#.U2H9Kq1dV18)
3. **ShareLatex**.com (v1 fonts changes) - [compilable online](https://www.sharelatex.com/templates/cv-or-resume/deedy-resume)
-->

## Changelog
### v1.3
 1. Removed MacFonts version as I have no desire to maintain it nor access to macOS
 2. Switched column ordering
 3. Changed font styles/colors for easier human readability
 4. Added, removed, and rearranged sections to reflect my own experience
 5. Hid last updated

### v1.2
 1. Added publications in place of societies.
 2. Collapsed a portion of education.
 3. Fixed a bug with alignment of overflowing long last updated dates on the top right.

### v1.1
 1. Fixed several compilation bugs with \renewcommand
 2. Got Open-source fonts (Windows/Linux support)
 3. Added Last Updated
 4. Moved Title styling into .sty
 5. Commented .sty file.

## Known Issues:
1. Overflows onto second page if any column's contents are more than the vertical limit
2. Hacky space on the first bullet point on the second column.

## License
    Original Work Copyright 2014 Debarghya Das
    Modified Work Copyright 2018 Zachary Taylor

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
