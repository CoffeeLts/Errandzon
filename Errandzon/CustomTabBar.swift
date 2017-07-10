//
//  CustomTabBar.swift
//  Errandzon
//
//  Created by LimTzeSuen on 10/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        
//        let tabBarController = self.window!.rootViewController as! UITabBarController
//        let tabBar = tabBarController.tabBar as UITabBar
        
        let tabBarItem1 = tabBar.items![0] as UITabBarItem
        let tabBarItem2 = tabBar.items![1] as UITabBarItem
        let tabBarItem3 = tabBar.items![2] as UITabBarItem
        let tabBarItem4 = tabBar.items![3] as UITabBarItem
        
        tabBarItem1.selectedImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        tabBarItem2.selectedImage = UIImage(named: "myjob")?.withRenderingMode(.alwaysOriginal)
        tabBarItem3.selectedImage = UIImage(named: "job")?.withRenderingMode(.alwaysOriginal)
        tabBarItem4.selectedImage = UIImage(named: "setting")?.withRenderingMode(.alwaysOriginal)
        

        
        
       
        
        tabBar.tintColor = UIColor.green
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
