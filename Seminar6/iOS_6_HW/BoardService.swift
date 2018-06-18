//
//  BoardService.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 5. 19..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

struct BoardService: APIService {
    
    // MARK: 게시글 조회(read)
    static func boardInit(completion: @escaping ([Board])->Void) {
        
        let URL = url("/board")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in //변수명
            switch res.result { //통신이 되었냐 안되었냐가 나온다?
            case .success:
                
                if let value = res.result.value {
                    
                    //////// Codable /////////
                    //목적 : 서버랑 클라랑 데이터를 주고 받을 때, 내가 자동으로 오면서 메세지라는 키로 오는 것은 메세지에 담아주고, data라는 키로 오는 것은 데이터에 담아주고 그러한 과정
                    let decoder = JSONDecoder()
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    do {
                        let boardData = try decoder.decode(BoardData.self, from: value)
                        
                        if boardData.message == "Successful Get Board Data" {

                            completion(boardData.data)
                        }
                        
                    } catch {
                        
                    }
        
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
    // MARK: 게시글 등록(create, 사진 무)
    static func saveContent(title: String, content: String, password: String, completion: @escaping ()->Void) {
        
        let URL = url("/board")
    
        let userdefault = UserDefaults.standard
        guard let nickName = userdefault.string(forKey: "nickName") else {return}
    
        let body: [String: Any] = [
            "user_id" : nickName, //값이 있으면 값이 나오고 없으면 default 값이 나온다. 옵셔널값 푸는 것
            "board_title" : title,
            "board_content" : content,
            "board_pw" : password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData() { res in
            switch res.result {
            case .success:
                
                if let value = res.result.value {
                    
                    let message = JSON(value)["message"].string
                    
                    if message == "Successful Register Board Data" {
                        completion()
                    }
                }
                
                break
                
                
            case .failure(let err):
                
                print(err.localizedDescription)
                break
            }
        }
    }
    
    // MARK: 게시글 등록(create, 사진 유)
    static func savePhotoContent(title: String, content: String, password: String, photo: UIImage, completion: @escaping ()->Void) {
        
        let URL = url("/board")
        
        let userdefault = UserDefaults.standard
        guard let nickname = userdefault.string(forKey: "nickName") else { return }
        
        let nickNameData = nickname.data(using: .utf8)
        let titleData = title.data(using: .utf8)
        let contentData = content.data(using: .utf8)
        let passwordData = password.data(using: .utf8)
        
        let photoData = UIImageJPEGRepresentation(photo, 0.3)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(nickNameData!, withName: "user_id")
            multipartFormData.append(titleData!, withName: "board_title")
            multipartFormData.append(contentData!, withName: "board_content")
            multipartFormData.append(passwordData!, withName: "board_pw")
            multipartFormData.append(photoData!, withName: "photo", fileName: "photo.jpg", mimeType: "image/jpeg")
            
        }, to: URL, method: .post, headers: nil ) { (encodingResult) in
            
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _) :
                
                upload.responseData(completionHandler: {(res) in
                    switch res.result {
                        case .success :
                            
                            if let value = res.result.value {
                                let message = JSON(value)["message"].string
                                
                                if message == "Successful Register Board Data" {
                                    print("이미지 업로드 성공")
                                    completion()
                                }
                            }
                        
                        case .failure(let err):
                            print(err.localizedDescription)
                    }
                })
                
                break
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
}
