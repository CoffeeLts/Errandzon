//
//  setNickNameViewController.swift
//  Errandzon
//
//  Created by ahkui on 2017/7/10.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class setNickNameViewController: UIViewController {
    var Server:ServerManage!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        Server = appDelegate.Server
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier!)
    }
    @IBAction func nextButton(){
        if let text = textField.text {
            Server.setNickName(text, callback: self.done)
            
        }
    }
    func done(_ status:ServerState){
        if status == ServerState.Pass {
            letsGo()
        }
    }
    func letsGo(){
        performSegue(withIdentifier: "nicknameGoTag", sender: nil)
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
