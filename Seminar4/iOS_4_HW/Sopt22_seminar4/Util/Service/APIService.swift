//
//  APIService.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 5. 19..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import Foundation

protocol APIService {

}

extension APIService {
   static func url(_ path: String) -> String {
        return "http://13.125.118.111:3009" + path
    }
}
