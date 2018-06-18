//
//  CommentData.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 5. 14..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import Foundation

struct CommentData: Codable {
    let message: String
    let data: [Comment]
}
