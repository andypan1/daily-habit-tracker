Original App Design Project
===

# Daily Habit Tracker

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

An app that allows users to track their daily habits and goals. Users can input their habits, set daily targets, and mark them as completed each day. The app could include features such as reminders, streak tracking, and motivational quotes to help users stay consistent with their habits.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:**  Productivity
- **Mobile:** People can keep track of habits they want to maintain and see the process of maintaining it.
- **Story:** Creates a well-balanced life for users, allowing them to share their progress with others. Market: Anybody can use this app. 
- **Market:** Anybody can use this app.
- **Habit:** Every user can use this everyday to keep track of thier progress and goals and daily habits.
- **Scope:** V1 will allow users to save goals. V2 will allow users to see a streak of how long they maintain thier goals. V3 will add motivional quotes to guide them.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users should be able to add and remove habits
* Users should be able to see their streak for each habit
* Users should be able to see a different motivational quote each day.

**Optional Nice-to-have Stories**

* Log in system where users can have a custom profile.

### 2. Screen Archetypes

[List of Habits] 
* User can see their habits
* User can see their streaks for each habit
* User can see a motivtional quote

[Add/Remove Habits]
* User can add/remove habits

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Screen
* Habit Management

**Flow Navigation** (Screen to Screen)

- [Home Screen]
* => Habit Management
- [Habit Management] [list second screen here]
* => Home Screen


## Wireframes

![Untitled (Draft)-1 4](https://github.com/andypan1/daily-habit-tracker/assets/123217573/8049c280-827d-4ca2-935a-b051ebd4b7ca)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Sprints
[Sprint 1]: Set up the project and added elements on to storyboard. Next sprint, work on the implementation of the home screen. A challenge I face was setting up the necessary controllers.

[Sprint 2]: Worked on API request for motivational quotes and displayed them. Next spring, add functionality for users to add tasks and see their streaks. A challenge I faced was getting the API to work as the formatting was different than other APIs I have seen.

[Sprint 3]: Allow users to add tasks and display it on a tableview.

https://github.com/andypan1/daily-habit-tracker/assets/123217573/fd9e5999-0577-451e-958b-bc5bf70091e3

https://github.com/andypan1/daily-habit-tracker/assets/123217573/cabc00d7-5c67-4365-87a0-16f731c798ee


## Schema 

### Models

Habits Struct: title: String, note: String, streak: Int

Quotes Struct: title: String, name: String

### Networking

- Quotes API: "https://zenquotes.io/api/random"
- Postman JSON (example) : [
    {
        "q": "Why live an ordinary life, when you can live an extraordinary one.",
        "a": "Tony Robbins",
        "h": "<blockquote>&ldquo;Why live an ordinary life, when you can live an extraordinary one.&rdquo; &mdash; <footer>Tony Robbins</footer></blockquote>"
    }
]

