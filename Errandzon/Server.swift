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
    var is_new:Bool = false
    var user:[UserColumn.RawValue:Any]!
    
    init() { }
    
    func login(_ email:String,callback:@escaping((_ state:ServerState) -> Void) ) {
        let data = "email=\(email)"
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/login")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request){  data, response, error in
            
            guard error == nil else {
                print(error!)
                callback(ServerState.TimeOut)
                return
            }
            
            guard let data = data else{
                print("Data is empty")
                callback(ServerState.TimeOut)
                return
            }
            
            let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
            if let json = jsonObject as? [String:Any] {
                if let isNew = json["is_new"] as? Bool {
                    self.is_new = isNew
                }
                
                if let data = json[ServerResponse.data.rawValue] as? [String:Any] {
                    self.user = data
                    if let newToken = data[UserColumn.api_token.rawValue] as? String {
                        self.token = newToken
                    }
                }
                
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                    self.setNickName("qwe", callback: self.test)
                }
                
            }
            
        }
        task.resume()
    }
    func test(_ state:ServerState){
        print("test")
    }
    func setNickName(_ nickname:String,callback:@escaping((_ state:ServerState) -> Void) ) {
        let data = "nickname=\(nickname)&api_token=\(token!)"
        print(data)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/setNickName")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request){  data, response, error in
            
            guard error == nil else {
                print(error!)
                callback(ServerState.TimeOut)
                return
            }
            
            guard let data = data else{
                print("Data is empty")
                callback(ServerState.TimeOut)
                return
            }
            
            let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
            print(jsonObject)
            if let json = jsonObject as? [String:Any] {
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
            
        }
        task.resume()
    }
}
enum ServerResponse:String {
    case status
    case data
}
enum ServerState:String {
    case Pass
    case Fail
    case TimeOut
}
enum UserColumn:String {
    case api_token
    case email
    case nickname
}
