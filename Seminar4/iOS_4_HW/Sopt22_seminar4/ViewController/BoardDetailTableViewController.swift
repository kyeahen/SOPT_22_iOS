//
//  BoardDetailTableViewController.swift
//  Sopt22_seminar4
//
//  Created by 이혜진 on 2018. 4. 30..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class BoardDetailTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var commentSendView: UIView!
    @IBOutlet weak var tvComment: UITextView!
    
    var comments: [Comment] = [Comment]()

    var titleName : String = ""
    var date : Date = Date()
    var content : String = ""
    var nickName : String = ""
    var img : String = ""
    var idx : Int = 0
    var pwd : String = ""
    
    // 화면 터치했을 때 키보드 사라지게 하는 gesture
    var keyboardDismissGesture: UITapGestureRecognizer?
    
    //뷰 컨트롤러가 화면에 나타나기 직전에 실행
    //뷰가 보일 때 마다 실행
    override func viewWillAppear(_ animated: Bool) {
        commentInit()
        setKeyboardSetting()
    }

    //뷰 컨트롤러가 생성될 때(단 한번, 초기화)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentInit()
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.tableFooterView = UIView(frame: .zero)
    
        setKeyboardSetting()
    }
    
    // MARK: *테이블뷰*
    
    // MARK: numberOfSections
    // 테이블 뷰의 section이 몇 개인지 명시
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: numberOfRowsInSection
    // DataSource의 메소드
    // 테이블 뷰의 섹션안의 row가 몇 개인지 명시
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return comments.count
        }
    }

    // MARK: cellForRowAt
    // DataSource의 메소드
    // row에 어떤 데이터가 들어갈지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
          let cell = tableView.dequeueReusableCell(withIdentifier: BoardDetailTableViewCell.reuseIdentifier) as! BoardDetailTableViewCell

            
            cell.labContent.text = content
            
            // 받은 날짜를 원하는 포맷에 맞춰 수정
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd HH:mm"
            cell.labDate.text = dateFormatter.string(for: date)
            
            cell.labNickName.text = nickName
            cell.labTitle.text = titleName
            
            // 이미지 받기
            // with : 이미지 경로
            // placeholder : 경로가 null일 때 기본으로 뜨게 할 이미지(UIImage 타입)
            //url로 오는 이미지를 이미지화 시켜야 함
            //킹피셔 = 자동으로 이미지뷰에 이미지를 넣어쥼
            
            cell.img.kf.setImage(with: URL(string: img), placeholder: UIImage())

            return cell

        }

        else {
          let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.reuseIdentifier) as! CommentTableViewCell

            cell.labCommentNickName.text = comments[indexPath.row].user_id
            cell.labCommentContent.text = comments[indexPath.row].comment_content
            
            // 받은 날짜를 원하는 포맷에 맞춰 수정
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let date = dateFormatter.date(from: comments[indexPath.row].comment_writetime)
            dateFormatter.dateFormat = "MM/dd HH:mm"
            
            cell.labCommentDate.text = dateFormatter.string(from: date!)
            
            return cell

        }
        
    }

    // MARK: *서버 통신*
    
    // MARK: 댓글 조회(read)
    func commentInit() {
        
        let URL = "http://13.125.118.111:3009/comment/\(idx)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in //변수명
            
            switch res.result { //통신이 되었냐 안되었냐가 나온다?
                
            case .success:
                
                if let value = res.result.value {
                    
                    //////// Codable /////////
                    //목적 : 서버랑 클라랑 데이터를 주고 받을 때, 내가 자동으로 오면서 메세지라는 키로 오는 것은 메세지에 담아주고, data라는 키로 오는 것은 데이터에 담아주고 그러한 과정
                 
                    let decoder = JSONDecoder()
                    
                    do {
                        
                        let commentData = try decoder.decode(CommentData.self, from: value)

                        if commentData.message == "Successful Get Comment Data" {
                            print("message")
                            self.comments = commentData.data //디코드해서 받아온 데이터
                            self.detailTableView.reloadData()
                            
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
    
    // MARK: 액션(댓글 전송)
    @IBAction func onSend(_ sender: UIButton) {
        
        if tvComment.text.isEmpty == true {
            let dialog = UIAlertController(title: "댓글 등록 실패", message: "모든 항목을 입력하세요", preferredStyle: .alert)

            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)

            dialog.addAction(action)
            
            self.present(dialog, animated: true, completion: nil)
            
        }
            
        else {
            
            let dialog = UIAlertController(title: "비밀번호", message: "비밀번호를 입력하세요", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "확인", style: .default) {(action) in
                self.pwd = dialog.textFields![0].text!
                self.saveComment(content: self.tvComment.text, password: self.pwd)
            }
            
            dialog.addTextField()
            
            dialog.addAction(action)
            
            self.present(dialog, animated: true, completion: nil)
            

        }
    }
    
    // MARK: 댓글 저장(create)
    func saveComment(content: String, password: String) {
        
        let URL = "http://13.125.118.111:3009/comment"
        
        let userdefault = UserDefaults.standard
        
        let body: [String: Any] = [
        
            "user_id" : gsno(userdefault.string(forKey: "nickName")), //값이 있으면 값이 나오고 없으면 default 값이 나온다. 옵셔널값 푸는 것
            "board_idx" : idx,
            "comment_content" : content,
            "comment_pw" : password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData() { res in
            
            switch res.result {
                
                case .success:
                    
                    if let value = res.result.value {
                        
                        print("댓글 등록 성공")
                        self.tvComment.text = ""
                        self.viewDidLoad()

                    }
                    
                break
                
                
                case .failure(let err):
                    
                    print("댓글 등록 실패")
                    
                    print(err.localizedDescription)
                    
                break
            }
        }
    }
}


extension BoardDetailTableViewController {
    
    //////// 외우지 않아도 되는 부분입니다. 표시된 부분만 고쳐서 사용하세요. ////////
    // 코드 설명 : 키보드가 나올 때 키보드의 높이를 계산해서 댓글 뷰가 키보드 위에 뜰 수 있도록 합니다.
    //          view.frame을 조정하면 키보드가 나오고 들어갈 때 뷰가 움직이게 되겠지요?
    //          notification : 옵저버라고 생각하시면 됩니다. 시점을 캐치하여 #selector()의 액션이 일어나도록 합니다.
    //                          이 코드에서는 키보드가 나올 때, 들어갈 때 의 시점을 캐치하여 뷰의 frame을 조정합니다.
    func setKeyboardSetting() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        adjustKeyboardDismissGesture(isKeyboardVisible: true)
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //////// 키보드의 사이즈만큼 commentSendView의 y축을 위로 이동시킴 ////////
            commentSendView.frame.origin.y -=
                keyboardSize.height
            ////////
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        adjustKeyboardDismissGesture(isKeyboardVisible: false)
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //////// 키보드의 사이즈만큼 commentSendView의 y축을 아래로 이동시킴 ////////
            commentSendView.frame.origin.y +=
                keyboardSize.height
            ////////
            self.view.layoutIfNeeded()
        }
    }
    
    func adjustKeyboardDismissGesture(isKeyboardVisible: Bool) {
        if isKeyboardVisible {
            if keyboardDismissGesture == nil {
                keyboardDismissGesture = UITapGestureRecognizer(target: self, action: #selector(tapBackground))
                view.addGestureRecognizer(keyboardDismissGesture!)
            }
        } else {
            if keyboardDismissGesture != nil {
                view.removeGestureRecognizer(keyboardDismissGesture!)
                keyboardDismissGesture = nil
            }
        }
    }
    
    @objc func tapBackground() {
        self.view.endEditing(true)
    }
    ////////
}
