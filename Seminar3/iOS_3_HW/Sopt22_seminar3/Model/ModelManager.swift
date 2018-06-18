//
//  ModelManager.swift
//  Sopt22_seminar3
//
//  Created by 이혜진 on 2018. 4. 16..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import Foundation

struct ModelManager {
    static let sharedInstance = ModelManager()
    
    var friends: [Profile] = [Profile]()

    
    init() {
        let friend1 = Profile(name: "엄마", profileImage: #imageLiteral(resourceName: "pikachu5"),
                              phone: "010-0000-0000", age: 51, birthday: "00.00")
        let friend2 = Profile(name: "아빠",
                              phone: "010-0000-0000", age: 51, birthday: "00.00")
        let friend3 = Profile(name: "바보탱구리", profileImage: #imageLiteral(resourceName: "pikachu2"),
                              phone: "010-0000-0000", age: 28, birthday: "00.00", message: "쿠루루")
        
        let friend4 = Profile(name: "민갱", profileImage: #imageLiteral(resourceName: "pikachu7"),
                              phone: "010-0000-0000", age: 23, birthday: "00.00")
        let friend5 = Profile(name: "혬",
                              phone: "010-0000-0000", age: 23, birthday: "00.00", message: "조별과제")
        let friend6 = Profile(name: "기매원", profileImage: #imageLiteral(resourceName: "pikachu9"),
                              phone: "010-0000-0000", age: 23, birthday: "00.00")
        let friend7 = Profile(name: "꽝", profileImage: #imageLiteral(resourceName: "pikachu4"),
                              phone: "010-0000-0000", age: 23, birthday: "00.00")
        let friend8 = Profile(name: "김욕빈", profileImage: #imageLiteral(resourceName: "pikachu10"),
                              phone: "010-0000-0000", age: 23, birthday: "00.00")
        let friend9 = Profile(name: "똥", profileImage: #imageLiteral(resourceName: "pikachu3"),
                              phone: "010-0000-0000", age: 23, birthday: "00.00")
        let friend10 = Profile(name: "나용", profileImage: #imageLiteral(resourceName: "pikachu6"),
                               phone: "010-0000-0000", age: 23, birthday: "00.00")
        
    
        let friend11 = Profile(name: "덕", profileImage: nil, phone: "", age: 0, birthday: "", message: nil)
        let friend12 = Profile(name: "승", profileImage: nil, phone: "", age: 0, birthday: "", message: nil)
        let friend13 = Profile(name: "정", profileImage: nil, phone: "", age: 0, birthday: "", message: nil)
        let friend14 = Profile(name: "박", profileImage: nil, phone: "", age: 0, birthday: "", message: nil)
        let friend15 = Profile(name: "박", profileImage: nil, phone: "", age: 0, birthday: "", message: nil)
        let friend16 = Profile(name: "장", profileImage: nil, phone: "", age: 0, birthday: "", message: nil)

        
        
        self.friends = [friend10, friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8, friend9]
        
        self.friends = friends.sorted(by: { $0.name < $1.name })
        
        self.friends.append(contentsOf: [friend11, friend12, friend13, friend14, friend15, friend16])
    }
}
