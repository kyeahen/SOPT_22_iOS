//
//  ChatViewController.swift
//  Sopt22_seminar3
//
//  Created by 김예은 on 2018. 5. 5..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var ChatTableView: UITableView!
    
    var chatList: [Chatting] = ChatModelManager.sharedInstance.chatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 대리자(delegate)가 self인 것을 명시해주어야 합니다.
        ChatTableView.delegate = self
        ChatTableView.dataSource = self
        
        // 테이블 뷰에 내용이 나오지 않는 하단 부분의 선을 없애줍니다.
        ChatTableView.tableFooterView = UIView(frame: .zero)
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    // 테이블 뷰의 섹션안의 row가 몇 개인지 명시
    // numberOfRowsInSection : UITableViewDataSource의 필수 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatList.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseIdentifier) as! ChatTableViewCell
        
        cell.viewCount.isHidden = true
        cell.labCount.isHidden = true
        
        cell.imgChat.image = chatList[indexPath.row].image ?? #imageLiteral(resourceName: "ic_male.png")
        cell.labTitle.text = chatList[indexPath.row].title
        cell.labContent.text = chatList[indexPath.row].lastContent
        cell.labChatNum.text = String(chatList[indexPath.row].chattingCount)
        cell.labDate.text = chatList[indexPath.row].date
        
        
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
