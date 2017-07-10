//
//  Server.swift
//  Errandzon
//
//  Created by ahkui on 2017/7/10.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import Foundation
class ServerManage {
    var token:String!
    
    init() {
        
    }
    func login(_ email:String,callback:@escaping((_ state:ServerState) -> Void) ) {
        let data = "email=\(email)"
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/login")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data.data(using: .utf8)
        print("start task")
        let task = URLSession.shared.dataTask(with: request){  data, response, error in
            print("begin task")
            print("check error")
            guard error == nil else {
                print(error!)
                callback(ServerState(rawValue: "TimeOut")!)
                return
            }
            print("check data")
            guard let data = data else{
                print("Data is empty")
                callback(ServerState(rawValue: "TimeOut")!)
                return
            }
            print("done")
            let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
            print(jsonObject)
            if let json = jsonObject as? [String:Any] {
                
                print(json)
                if let status = json["status"] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
            
        }
        task.resume()
    }
}

enum ServerState:String {
    case Pass
    case Fail
    case TimeOut
}
