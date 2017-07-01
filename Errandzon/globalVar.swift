//
//  globalVar.swift
//  Errandzon
//
//  Created by LimTzeSuen on 2017/6/27.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit


var colors:[UIColor] = [UIColor(rgb: 0x1abc9c),
                        UIColor(rgb: 0x16a085),
                        UIColor(rgb: 0x2ecc71),
                        UIColor(rgb: 0x27ae60),
                        UIColor(rgb: 0x3498db),
                        UIColor(rgb: 0x2980b9),
                        UIColor(rgb: 0x9b59b6),
                        UIColor(rgb: 0x8e44ad),
                        UIColor(rgb: 0xe74c3c),
                        UIColor(rgb: 0xc0392b),
                        UIColor(rgb: 0xe67e22),
                        UIColor(rgb: 0xd35400),
                        UIColor(rgb: 0xf1c40f),
                        UIColor(rgb: 0xf39c12)]


var errands:[Errands] = [
    Errands(publisher: "Dendi", title: "Delivery", details: "Need help to delivery to package to sunshine street", rewards: "5 apples", publishTime: "100 light years ago"),
    Errands(publisher: "Hui Lian", title: "Purchase and Delivery", details: "Need help to buy McDonald's Double CheeseBurger with set A combo, regular coke with no ice!", rewards: "Some fries", publishTime: "now"),
    Errands(publisher: "Jack", title: "Rescue mission", details: "Urgent help needed! Help me save Rose!", rewards: "Gratitude", publishTime: "??"),
    Errands(publisher: "Duke", title: "Personal yoga Instructor", details: "I'm new to yoga, I'm willing to offer a considerate amount of money if YOU can be my personal yoga instructor( of course the money depends on the result of your teachings", rewards: "Cash(depends on result)", publishTime: "5 seconds ago"),
    Errands(publisher: "Matt Damon", title: "I'm always dying", details: "I need some serious support as I'm always playing the role that eventually die in movies", rewards: "Signature from ME", publishTime: "5 hours ago")
]
var tags:[String] = ["Delivery","Foods","Companion","Coach","Player","Sports","Gamer","Swimming","Coding","Project","Fishing","Modeling","Designer","Promoter","Sales","Repair","Tutor","Partner","Survey","Entertainer","Comedian","Heavy lifting"]

var myPostList:[Errands] = [
    Errands(publisher: "Me", title: "blablabla", details: "Things you don't need to care", rewards: "Make yourself useful", publishTime: "123123"),
    Errands(publisher: "Me", title: "Javelin Coach Wanted!", details: "Need someone to guide me in javelin throwing", rewards: "Good Deed", publishTime: "now"),
]

var myAcceptErrands:[Errands] = [
    Errands(publisher: "Dendi", title: "Delivery", details: "Need help to delivery to package to sunshine street", rewards: "5 apples", publishTime: "100 light years ago"),
    Errands(publisher: "Matt Damon", title: "I'm always dying", details: "I need some serious support as I'm always playing the role that eventually die in movies", rewards: "Signature from ME", publishTime: "5 hours ago")
]
