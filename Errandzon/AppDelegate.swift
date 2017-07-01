//
//  AppDelegate.swift
//  Errandzon
//
//  Created by RTC02 on 2017/6/5.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
   
    
    
    var errands:[Errands] = [
        Errands(publisher: "Dendi", title: "Delivery", details: "Need help to delivery to package to sunshine street", rewards: "5 apples", publishTime: "100 light years ago"),
        Errands(publisher: "Hui Lian", title: "Purchase and Delivery", details: "Need help to buy McDonald's Double CheeseBurger with set A combo, regular coke with no ice!", rewards: "Some fries", publishTime: "now"),
        Errands(publisher: "Jack", title: "Rescue mission", details: "Urgent help needed! Help me save Rose!", rewards: "Gratitude", publishTime: "??"),
        Errands(publisher: "Duke", title: "Personal yoga Instructor", details: "I'm new to yoga, I'm willing to offer a considerate amount of money if YOU can be my personal yoga instructor( of course the money depends on the result of your teachings", rewards: "Cash(depends on result)", publishTime: "5 seconds ago"),
        Errands(publisher: "Matt Damon", title: "I'm always dying", details: "I need some serious support as I'm always playing the role that eventually die in movies", rewards: "Signature from ME", publishTime: "5 hours ago")
        ]
    
    
    var myPostList:[Errands] = [
        Errands(publisher: "Me", title: "blablabla", details: "Things you don't need to care", rewards: "Make yourself useful", publishTime: "123123"),
        Errands(publisher: "Me", title: "Javelin Coach Wanted!", details: "Need someone to guide me in javelin throwing", rewards: "Good Deed", publishTime: "now"),
        ]
    
    var myAcceptErrands:[Errands] = [
        Errands(publisher: "Dendi", title: "Delivery", details: "Need help to delivery to package to sunshine street", rewards: "5 apples", publishTime: "100 light years ago"),
        Errands(publisher: "Matt Damon", title: "I'm always dying", details: "I need some serious support as I'm always playing the role that eventually die in movies", rewards: "Signature from ME", publishTime: "5 hours ago")
        ]
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
//        [[UINavigationBar appearance] setBarTintColor:myColor];
//        [[UINavigationBar appearance] setTranslucent:NO];
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

