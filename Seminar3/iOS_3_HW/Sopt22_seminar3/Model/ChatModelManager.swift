//
//  ChatModelManager.swift
//  Sopt22_seminar3
//
//  Created by 김예은 on 2018. 5. 5..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import Foundation

struct ChatModelManager {
    static let sharedInstance = ChatModelManager()
    
    var chatList: [Chatting] = [Chatting]()
    
    
    init() {
        let chat1 = Chatting(friends: [Profile(name: "똥", profileImage: #imageLiteral(resourceName: "pikachu3"),
                                               phone: "010-0000-0000", age: 23, birthday: "00.00")], id: 0, title: "똥", image: #imageLiteral(resourceName: "pikachu3"), lastContent: "ㅎㅎ", chattingCount: 4, date: "오후 6:29")
        let chat2 = Chatting(friends: [Profile(name: "민갱", profileImage: #imageLiteral(resourceName: "pikachu7"),
                                               phone: "010-0000-0000", age: 23, birthday: "00.00")], id: 0, title: "민갱", image: #imageLiteral(resourceName: "pikachu7.jpeg"), lastContent: "ㅎㅇ", chattingCount: 15, date: "오후 6:29")
        let chat3 = Chatting(friends: [Profile(name: "승수", profileImage: nil, phone: "", age: 0, birthday: "", message: nil)], id: 0, title: "승", image: #imageLiteral(resourceName: "ic_male.png"), lastContent: "ㅋㅋㅋㅋ", chattingCount: 2, date: "오후 6:29")
        
        self.chatList = [chat1, chat2, chat3]
        
    }
}
