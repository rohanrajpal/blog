---
layout: post
title:  "Probability: Learning concepts via problems [Draft]"
toc: true
comments: true
categories: ["Deep Learning"]
---

A simple blog on me trying to brush up my probability concepts while preparing for data science companies.

[https://github.com/dalmia/Deep-Learning-Book-Chapter-Summaries](https://github.com/dalmia/Deep-Learning-Book-Chapter-Summaries)

[Probability questions](https://www.analyticsvidhya.com/blog/2017/04/40-questions-on-probability-for-all-aspiring-data-scientists/)

## Drawing cards

*A player is randomly dealt a sequence of 13 cards from a deck of 52-cards. All sequences of 13 cards are equally likely. In an equivalent model, the cards are chosen and dealt one at a time. When choosing a card, the dealer is equally likely to pick any of the cards that remain in the deck. If you dealt 13 cards, what is the probability that the 13th card is a King?*

**Solution 1:** Since we arent told about the previous 12 cards. The probability of drawing the 13th is same as probability of drawing the first one.

**Solution 2:** Is we use the choose method. Then we have 4 cases

C-1: No kings in prev 12
C-2: One king in prev 12
C-3: Two kings in prev 12
C-4: Three kings in prev 12

Add them up and you'll get 1/13.

*A fair six-sided die is rolled 6 times. What is the probability of getting all outcomes as unique?*

- wrong approach, 1/6 x 1/5 x 1/4. We have to consider all possible combinations, not one of those left
- right approach, (6x5x..1)/(6x6x6 .. 6)

**My mistakes**: 
    - I wasnt taking care of the permutations in the second approach
    - Choosing from the same set twice, you divide only when you dont care about the order.

*A group of 60 students is randomly split into 3 classes of equal size. All partitions are equally likely. Jack and Jill are two students belonging to that group. What is the probability that Jack and Jill will end up in the same class?*

**Sol1** 
possible = pick one from three classes * choose 18 from remaining 58 students * choose 20 from remaining 40 students
total = 60c20 * 40c20 * 20c20 / 3!

**Sol2**
let students 1..20 be in 1, 20...40 be in 2, 40...60 be in 3. If we give a random number to Jack, then 59 possibilities for Jill and 19 of them to be in the same group. So prob is 19/59
