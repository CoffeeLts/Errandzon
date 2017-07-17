//
//  globalVar.swift
//  Errandzon
//
//  Created by LimTzeSuen on 2017/6/27.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit




var colors:[UIColor] = [UIColor(rgb: 0x1abc9c,alphaLevel: 0.7),
                        UIColor(rgb: 0x16a085,alphaLevel: 0.7),
                        UIColor(rgb: 0x2ecc71,alphaLevel: 0.7),
                        UIColor(rgb: 0x27ae60,alphaLevel: 0.7),
                        UIColor(rgb: 0x3498db,alphaLevel: 0.7),
                        UIColor(rgb: 0x2980b9,alphaLevel: 0.7),
                        UIColor(rgb: 0x9b59b6,alphaLevel: 0.7),
                        UIColor(rgb: 0x8e44ad,alphaLevel: 0.7),
                        UIColor(rgb: 0xe74c3c,alphaLevel: 0.7),
                        UIColor(rgb: 0xc0392b,alphaLevel: 0.7),
                        UIColor(rgb: 0xe67e22,alphaLevel: 0.7),
                        UIColor(rgb: 0xd35400,alphaLevel: 0.7),
                        UIColor(rgb: 0xf1c40f,alphaLevel: 0.7),
                        UIColor(rgb: 0xf39c12,alphaLevel: 0.7)]


var errands:[Errands] = [
    Errands(publisher: "Dendi", title: "Delivery", details: "Need help to delivery to package to sunshine street", rewards: "5 apples", publishTime: "100 light years ago",tags: ["Delivery","Foods"]),
    Errands(publisher: "Hui Lian", title: "Purchase and Delivery", details: "Need help to buy McDonald's Double CheeseBurger with set A combo, regular coke with no ice!", rewards: "Some fries", publishTime: "now",tags: ["Delivery","Foods"]),
    Errands(publisher: "Jack", title: "Rescue mission", details: "Urgent help needed! Help me save Rose!", rewards: "Gratitude", publishTime: "??",tags: ["Heavy lifting","Swimming"]),
    Errands(publisher: "Duke", title: "Personal yoga Instructor", details: "I'm new to yoga, I'm willing to offer a considerate amount of money if YOU can be my personal yoga instructor( of course the money depends on the result of your teachings", rewards: "Cash(depends on result)", publishTime: "5 seconds ago",tags: ["Coach",]),
    Errands(publisher: "Josh", title: "Order Pizzas", details: "I need someone to order 1000 pizzas,500 cans of coca cola.", rewards: "kiss", publishTime: "4 hours ago",tags: ["Delivery","Foods"]),
    Errands(publisher: "Flash", title: "Clean Toilet", details: "Need help to  clean toilet due to sudden out burst from long term constipation", rewards: "2 cup of yogurts", publishTime: "100 light years ago",tags: ["Cleaning"]),
    Errands(publisher: "Loius", title: "Drinking game", details: "Looking for competitors to challenge my drinking game, includes rum, wine, vodka and many more", rewards: "Free Drinks", publishTime: "now",tags: ["companian","foods"]),
    Errands(publisher: "Chris Evan", title: "Proposal plan", details: "Help wanted for a nifty and creative plan to propose to the love of life ---- Lily", rewards: "Free to touch my abs", publishTime: "??",tags: ["Planner"]),
    Errands(publisher: "Chris Hemsworth", title: "Urgent! Delivery wanted!", details: "I have forgotten to bring my mighty hammer with me! Your assistance in this matter will be a big help to me. Fighting, love you.", rewards: "A glimpse of spark", publishTime: "5 seconds ago",tags: ["delivery"]),
    Errands(publisher: "Aurora", title: "I'm always sleeping", details: "I need some serious alarm, or someone to wake up me !", rewards: "Gratitude", publishTime: "5 hours ago",tags: ["Reminder"]),
    Errands(publisher: "Winky", title: "Help me in iOS coding!!!", details: "I'm rushing a project now but I'm on the verge of dying right here, any help would be sufficient!", rewards: "10000NT", publishTime: "100 light years ago",tags: ["Coding","Project","Tutor"]),
    Errands(publisher: "Cookie Lee", title: "Looking for cooking lessons", details: "I'm an amatuer when it comes to cooking, please do offer your kindness in guiding me.", rewards: "some cookies", publishTime: "now",tags: ["Cooking","Foods"]),
    Errands(publisher: "Hello Kitty", title: "Looking for my long lost mouth", details: "My mouth is dropped somewhere! Please help me to find it", rewards: "Pink stuffs", publishTime: "??",tags: ["Lost"]),
    Errands(publisher: "Lily", title: "Clear stages in Candy Crush", details: "I'm stuck in stage 300 for ages QAQ, looking for expert or bored people to help me! PS: send me lives as well", rewards: "I'll send you some lives too", publishTime: "5 seconds ago",tags: ["Gamer", "Player"]),
    Errands(publisher: "Ge fei", title: "Repairing", details: "My keyboard is broken, please help me to fix it", rewards: "Lame jokes", publishTime: "5 hours ago",tags: ["Repair"])
]

var user_tags = ["Delivery","Coding","Fishing","Repair","Others"]

var tags:[String] = ["Delivery","Foods","Companion","Coach","Player","Sports","Gamer","Swimming","Coding","Project","Fishing","Modeling","Designer","Promoter","Sales","Repair","Tutor","Partner","Survey","Entertainer","Comedian","Heavy lifting","Planner","Cleaning", "Reminder" ,"Cooking", "Lost","Others"]
    

var myPostList:[Errands] = [
    Errands(publisher: "Me", title: "blablabla", details: "Things you don't need to care", rewards: "Make yourself useful", publishTime: "123123", tags:["Others"]),
    Errands(publisher: "Me", title: "Javelin Coach Wanted!", details: "Need someone to guide me in javelin throwing", rewards: "Good Deed", publishTime: "now", tags: ["Coach"])
]

var myAcceptErrands:[Errands] = [
    Errands(publisher: "Lily", title: "Clear stages in Candy Crush", details: "I'm stuck in stage 300 for ages QAQ, looking for expert or bored people to help me! PS: send me lives as well", rewards: "I'll send you some lives too", publishTime: "5 seconds ago",tags: ["Gamer", "Player"]),
    Errands(publisher: "Ge fei", title: "Repairing", details: "My keyboard is broken, please help me to fix it", rewards: "Lame jokes", publishTime: "5 hours ago",tags: ["Repair"])
]


