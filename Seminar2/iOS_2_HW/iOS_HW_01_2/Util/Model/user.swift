//
//  user.swift
//  iOS_HW_01_2
//
//  Created by 김예은 on 2018. 4. 27..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

class user {
    
    var id : String?
    var pwd : String?
    var name : String?
    var birth : String?
    var part :  String
    var gender : String
    
    init(id : String, pwd : String, name : String, birth : String, part: String , gender : String){
        self.id = id
        self.pwd = pwd
        self.name = name
        self.birth = birth
        self.part = part
        self.gender = gender
    }
    
}

var userArr:[user] = [user]()

