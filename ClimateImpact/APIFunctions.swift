//
//  APIFunctions.swift
//  ClimateImpact
//
//  Created by Pranav Kumar Soma on 12/25/21.
//

import Foundation
import Alamofire

struct User: Decodable{
    var username: String
    var password: String
    var address: String
    var city: String
    var state: String
    var zipCode: String
    var county: String
    var commuteTime: String
    var commute: String
    var user: String
    
    
}

class APIFunctions{
  //  var delegate: DataDelegate?
    func fetchUsers(){
        AF.request("http://192.168.0.100:8081/fetch").response{ response in
            print(response.data)
            
            let data = String(data: response.data!, encoding: .utf8)
        
          //  self.delegate?.updateArray(newArray: data)
        }
    }
    
    func addUsers1(username: String, password: String, address: String, city: String, state: String, zipCode: String, user: String){
        AF.request("http://192.168.0.100.8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["username": username, "password": password, "address": address, "city": city, "state": state, "zipCode": zipCode, "user": user]).responseJSON{
            response in
        }
    }
}

