//
//  HomePageViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 10/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
  
    lazy var menuBar: MenuBar = {
        let mb  = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Errandzon"
        setupMenuBar()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setupMenuBar(){
        //        navigationController?.hidesBarsOnSwipe = true
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
       
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
       
    }
    func switchPage(menuIndex: Int){
        if(menuIndex == 0 ){
            self.firstView.isHidden = false
            self.secondView.isHidden = true
        }
        else{
            self.firstView.isHidden = true
            self.secondView.isHidden = false
        }
        
    }

    
    


}
