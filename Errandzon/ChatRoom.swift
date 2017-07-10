//
//  ChatRoom.swift
//  Errandzon
//
//  Created by LimTzeSuen on 10/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

struct Chat {
    var user: Int!
    var msg: String!
}

class ChatRoom: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var chatsLog = [Chat(user: 0, msg: "Hi"),
                    Chat(user: 1, msg: "Hello"),
                    Chat(user: 0, msg: "I need Pizza"),
                    Chat(user: 0, msg: "Delivery"),
                    Chat(user: 1, msg: "123"),
                    Chat(user: 1, msg: "23"),
                    Chat(user: 1, msg: "34"),
                    Chat(user: 0, msg: "aa"),
                    Chat(user: 0, msg: "bb"),
                    Chat(user: 1, msg: "1231231"),
                    Chat(user: 0, msg: "a"),
                    Chat(user: 1, msg: "232"),
                    Chat(user: 1, msg: "5345"),
                    Chat(user: 0, msg: "a"),
                    Chat(user: 0, msg: "s"),
                    Chat(user: 1, msg: "Hi"),
                    Chat(user: 0, msg: "Hi"),
                    Chat(user: 1, msg: "Hi"),
                    Chat(user: 0, msg: "Hi"),
                    ]
    
    
    
    
    @IBOutlet var chatTableView: UITableView!
    @IBAction func unwindToChatRoom(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView(){
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    

}
