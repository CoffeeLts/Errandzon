//
//  Server.swift
//  Errandzon
//
//  Created by ahkui on 2017/7/10.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import Foundation
class ServerManage {
    var alltags = [String]()
    var subscribedTags = [String]()
    var notSubscribedTags = [String]()
    var matchedErrands = [Errands]()
    var allErrands = [Errands]()
    var acceptedErrands = [Errands]()
    var errandsByMe = [Errands]()
    
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
    func addTag(_ tag:[String],callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["tag":tag,"api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/addTag")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
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
//            print(String(data: data, encoding: .utf8))
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
    
    func removeTags(_ tag:[String],callback:@escaping((_ state:ServerState) -> Void) ) {
        print("Number of tags to remove: \(tag.count)")
        let json:[String:Any] = ["tag":tag,"api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/removeTag")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
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
            //            print(String(data: data, encoding: .utf8))
            let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
            //print(jsonObject)
            if let json = jsonObject as? [String:Any] {
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
        }
        task.resume()
    }
    
    //------------------------ TAGS
    func getAllTags(callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/allTag")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
        
        self.alltags.removeAll()
        
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
                if let tag_data = json["data"] as? [Any] {
                    for jsonDict in tag_data {
                        if let item = jsonDict as? [String:Any]{
                            if let tag_name = item["name"] as? String{
                                self.alltags.append(tag_name)
                            }
                        }
                    } 
                }
                
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
        }
        task.resume()
    }
    
    func getSubscribedTags(callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/getSubscribeTag")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
        
        self.subscribedTags.removeAll()
        
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
                if let tag_data = json["data"] as? [Any] {
                    for jsonDict in tag_data {
                        if let item = jsonDict as? [String:Any]{
                            if let tag_name = item["name"] as? String{
                                self.subscribedTags.append(tag_name)
                            }
                        }
                    }
                }
                
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
        }
        task.resume()
    }
    
    func getNotSubscribedTags(callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/getUnsubscribeTag")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
        
        self.notSubscribedTags.removeAll()
        
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
            //print(jsonObject)
            
            if let json = jsonObject as? [String:Any] {
                if let tag_data = json["data"] as? [Any] {
                    for jsonDict in tag_data {
                        if let item = jsonDict as? [String:Any]{
                            if let tag_name = item["name"] as? String{
                                self.notSubscribedTags.append(tag_name)
                            }
                        }
                    }
                }
                
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
        }
        task.resume()
    }
    
 
    
    //  -------------------------- for All Errands ---------------------------
    
    func getAllErrands(callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/getUnsubscribeJob")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
        
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
            print("All Errands")
           // print(jsonObject)
            
            if let json = jsonObject as? [String:Any] {
                if let errand_data = json["data"] as? [Any] {
                    for itemDict in errand_data {
                       // print(itemDict)
                        
                        
                        if let item = itemDict as? [String:Any]{
                            
                            let title = item["title"] as! String
                            let details = item["details"] as! String
                            let rewards = item["rewards"] as! String
                            var nickname:String!
                            
                            if let publisher = item["publisher"] as? [String:Any]{
                                if let nicknameTest = publisher["nickname"] as? String{
                                    nickname = nicknameTest
                                }
                                else{
                                    nickname = "No Name"
                                }
                            }
          
                            let errand_tags = item["tagName"] as? [String]
                            
                            let tempErrand = Errands(publisher: nickname, title: title, details: details, rewards: rewards, tags: errand_tags!)
                            
                            self.allErrands.append(tempErrand)
                        }
                    }
                }
                
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
        }
        task.resume()
    }
    // ----- mAtched -------
    func getMatchedErrands(callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/getSubscribeJob")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
        
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
            print("Matched Errands")
            
            if let json = jsonObject as? [String:Any] {
                 print("Matched Errands1")
                if let errand_data = json["data"] as? [Any] {
                     print("Matched Errands2")
                    print(errand_data)
                    print("Matched Errands = \(errand_data.count)")
                    for itemDict in errand_data {
                        
                        
                        
                        print(itemDict)
                        
                        
                        if let item = itemDict as? [String:Any]{
                            
                            let title = item["title"] as! String
                            let details = item["details"] as! String
                            let rewards = item["rewards"] as! String
                            var nickname:String!
                            
                            if let publisher = item["publisher"] as? [String:Any]{
                                if let nicknameTest = publisher["nickname"] as? String{
                                    nickname = nicknameTest
                                }
                                else{
                                    nickname = "No Name"
                                }
                            }
                            
                            let errand_tags = item["tagName"] as? [String]
                            
                            let tempErrand = Errands(publisher: nickname, title: title, details: details, rewards: rewards, tags: errand_tags!)
                            
                            self.matchedErrands.append(tempErrand)
                        }
                    }
                }
                
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
        }
        task.resume()
    }
    // -------------------------- Accepted Errands -------------------------------
    func getAcceptedErrands(callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/getJobAccept")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
        
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
            print("Accepted Errands")
            
            if let json = jsonObject as? [String:Any] {
                if let errand_data = json["data"] as? [Any] {
                    for itemDict in errand_data {
                        print(itemDict)
                        
                        
                        if let item = itemDict as? [String:Any]{
                            
                            let title = item["title"] as! String
                            let details = item["details"] as! String
                            let rewards = item["rewards"] as! String
                            var nickname:String!
                            
                            if let publisher = item["publisher"] as? [String:Any]{
                                if let nicknameTest = publisher["nickname"] as? String{
                                    nickname = nicknameTest
                                }
                                else{
                                    nickname = "No Name"
                                }
                            }
                            
                            let errand_tags = item["tagName"] as? [String]
                            
                            let tempErrand = Errands(publisher: nickname, title: title, details: details, rewards: rewards, tags: errand_tags!)
                            
                            self.acceptedErrands.append(tempErrand)
                        }
                    }
                }
                
                if let status = json[ServerResponse.status.rawValue] as? String {
                    callback(ServerState(rawValue: status)!)
                }
            }
        }
        task.resume()
    }
    
    func getErrandsByMe(callback:@escaping((_ state:ServerState) -> Void) ) {
        let json:[String:Any] = ["api_token":token!]
        let data = try? JSONSerialization.data(withJSONObject: json,options: .prettyPrinted)
        let url = URL(string: "http://selab2.ahkui.com:1000/api/Errandzon/getJobPublish")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = data
        
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
            print("My Errands")
            
            if let json = jsonObject as? [String:Any] {
                if let errand_data = json["data"] as? [Any] {
                    for itemDict in errand_data {
                        print(itemDict)
                        
                        
                        if let item = itemDict as? [String:Any]{
                            
                            let title = item["title"] as! String
                            let details = item["details"] as! String
                            let rewards = item["rewards"] as! String
                            var nickname:String!
                            
                            if let publisher = item["publisher"] as? [String:Any]{
                                if let nicknameTest = publisher["nickname"] as? String{
                                    nickname = nicknameTest
                                }
                                else{
                                    nickname = "No Name"
                                }
                            }
                            
                            let errand_tags = item["tagName"] as? [String]
                            
                            let tempErrand = Errands(publisher: nickname, title: title, details: details, rewards: rewards, tags: errand_tags!)
                            
                            self.errandsByMe.append(tempErrand)
                        }
                    }
                }
                
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
