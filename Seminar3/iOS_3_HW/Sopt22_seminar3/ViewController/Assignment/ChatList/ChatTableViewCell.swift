//
//  ChatTableViewCell.swift
//  Sopt22_seminar3
//
//  Created by 김예은 on 2018. 5. 5..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgChat: UIImageView!
    @IBOutlet weak var labTitle: UILabel!
    @IBOutlet weak var labContent: UILabel!
    @IBOutlet weak var labCount: UILabel!
    @IBOutlet weak var labDate: UILabel!
    @IBOutlet weak var labChatNum: UILabel!
    @IBOutlet weak var viewChatNum: UIView!
    @IBOutlet weak var viewCount: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // 프로필 이미지 동그란 모양으로 만들기
        imgChat.layer.masksToBounds = true
        imgChat.layer.cornerRadius = imgChat.layer.frame.width/2
        imgChat.layer.borderWidth = 0.1
        
        //채팅 갯수 둥글게 만들기
        viewChatNum.layer.masksToBounds = true
        viewChatNum.layer.cornerRadius = viewChatNum.layer.frame.width/2
        viewChatNum.layer.borderWidth = 0.1
        
        //인원 수 테두리
        viewCount.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewCount.layer.borderWidth = 0.1
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
