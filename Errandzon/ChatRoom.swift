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

class ChatRoom: UIViewController {
    
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
                    Chat(user: 0, msg: "aasd"),
                    Chat(user: 0, msg: "sasd"),
                    Chat(user: 1, msg: "123123"),
                    Chat(user: 0, msg: "asdasd"),
                    Chat(user: 1, msg: "1231"),
                    Chat(user: 0, msg: "asd"),
                    ]
    
    
    
    
    @IBOutlet var chatTableView: UITableView!
    @IBAction func unwindToChatRoom(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

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
    
    
    
    

}

extension ChatRoom: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsLog.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChatRoomCell?
        //left
        if(chatsLog[indexPath.row].user == 1){
            cell = tableView.dequeueReusableCell(withIdentifier: "left", for: indexPath) as? ChatRoomCell
            print(chatsLog[indexPath.row].msg)
            cell?.leftLabel.text = chatsLog[indexPath.row].msg
        }
        else{ //right
            cell = tableView.dequeueReusableCell(withIdentifier: "right", for: indexPath) as? ChatRoomCell
            print(chatsLog[indexPath.row].msg)
            cell?.rightLabel.text = chatsLog[indexPath.item].msg
        }
        
        
        
        
        
        
        
        return cell!
    }
    
    
    
    
    
}






