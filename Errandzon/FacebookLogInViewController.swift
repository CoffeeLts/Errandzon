//
//  FacebookLogInViewController.swift
//  Errandzon
//
//  Created by lily on 2017/7/9.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class FacebookLogInViewController: UIViewController ,FBSDKLoginButtonDelegate{
    @IBOutlet weak var facebookLogInButton: FBSDKLoginButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        proccessLogin()
        facebookLogInButton.readPermissions = ["public_profile", "email", "user_friends"]
        facebookLogInButton.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //            FBSDKLoginManager().logOut()
    }
    
    func fetchProfile(){
        print("fetch profile")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        proccessLogin()
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func proccessLogin(){
        if FBSDKAccessToken.current() == nil {
            return
        }
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: {
            connection, result, error -> Void in
            if let error = error {
                print("longinerror =\(error)")
                return
            }
            if let resultNew = result as? [String:Any]{
                let email = resultNew["email"]  as! String
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.Server.login(email, callback: self.done)
                print("here proccesslogin \(email)")
                //                let firstName = resultNew["first_name"] as! String
                //                print(firstName)
                //                let lastName = resultNew["last_name"] as! String
                //                print(lastName)
                //                if let picture = resultNew["picture"] as? NSDictionary,
                //                    let data = picture["data"] as? NSDictionary,
                //                    let url = data["url"] as? String {
                //                    print(url) //臉書大頭貼的url, 再放入imageView內秀出來
                //                }
                //                self.performSegue(withIdentifier: "setUserNameSegue", sender: nil)
            }
            
        })
    }
    
    func done(status : ServerState){
        print(status)
        if status == ServerState.Pass {
            if appDelegate.Server.is_new {
                self.performSegue(withIdentifier: "setUserNameSegue", sender: nil)
            }else{
                self.performSegue(withIdentifier: "goHome", sender: nil)
            }
        }
        
    }
    
}


