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
   //

        

        
        tabBar.tintColor = UIColor.green
        tabBarItem.selectedImage = UIImage(named: "home")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        
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
