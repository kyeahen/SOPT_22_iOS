//
//  Comment.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 5. 14..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import Foundation

struct Comment: Codable {
    //서버와 이름을 동기화하기 위해 이름 통일
    let user_id : String
    let board_idx : Int
    let comment_content : String
    let comment_pw : String
    let comment_writetime : String
}
