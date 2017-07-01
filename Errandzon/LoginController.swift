//
//  ViewController.swift
//  Errandzon
//
//  Created by RTC02 on 2017/6/5.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameFT: UITextField!
    @IBOutlet var passwordFT: UITextField!
    @IBOutlet var loginButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setGradientBackground() {
        let colorTop =  UIColor(red: 24.0/255.0, green: 237.0/255.0, blue: 234.0/255.0, alpha: 100.0).cgColor
        let colorBottom = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 100.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x:1.0,y: 1.0)
        gradientLayer.endPoint = CGPoint(x:0.0, y: 0.0)
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func Login(_ sender: Any) {
        
        let username = usernameFT.text
        let password = passwordFT.text
        
        if (username == "" || password == ""){
            return
        }
        
        doLogin(user: username!, psw: password!)
        
        
    }
    
    func doLogin(user:String, psw:String){
        
        
//        to be fill later ---> need to combine with server
        
    }
    
    func loginDone(){
        usernameFT.isEnabled = false
        passwordFT.isEnabled = false 
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
