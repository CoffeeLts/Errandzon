//
//  SearchBarInNav.swift
//  Errandzon
//
//  Created by RTC14 on 2017/6/14.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class SearchBarInNav: UINavigationController {
    
    lazy var searchBars:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var leftNavBarButton = UIBarButtonItem(customView: searchBars)
//        self.navigationItem.leftBarButtonItem = leftNavBarButton
//        
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
