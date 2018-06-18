//
//  DetailViewController.swift
//  Sopt22_seminar3
//
//  Created by 김예은 on 2018. 5. 5..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labPhoneNum: UILabel!
    @IBOutlet weak var labAge: UILabel!
    @IBOutlet weak var labBirth: UILabel!
    @IBOutlet weak var viewPhoneNum: UIView!
    @IBOutlet weak var viewAge: UIView!
    @IBOutlet weak var viewBirth: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labMessage: UILabel!
    @IBOutlet weak var stackViewMessage: UIStackView!
    
    var img : UIImage?
    var name : String = ""
    var age : String? = ""
    var phoneNum : String = ""
    var birth : String = ""
    var message : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgProfile.image = img
        labName.text = name
        labAge.text = age
        labPhoneNum.text = phoneNum
        labBirth.text = birth
        labMessage.text = message
        
        //나이, 생일, 전화번호, 대화명이 없을 때 숨기기
        if age == "0" {
            labAge.isHidden = true
            viewAge.isHidden = true
            stackView.isHidden = true
            
        }
        else {
            labAge.isHidden = false
            viewAge.isHidden = false
        }
        
        if birth == "" {
            labBirth.isHidden = true
            viewBirth.isHidden = true
            stackView.isHidden = true
        }
        else {
            labBirth.isHidden = false
            viewBirth.isHidden = false
        }
        
        if phoneNum == "" {
            labPhoneNum.isHidden = true
            viewPhoneNum.isHidden = true
            stackView.isHidden = true
        }
        else {
            labPhoneNum.isHidden = false
            viewPhoneNum.isHidden = false
        }
        
        if message == "" {
            stackViewMessage.isHidden = true
        }
        else {
            stackViewMessage.isHidden = false
        }
        
        // 프로필 이미지 동그란 모양으로 만들기
        imgProfile.layer.masksToBounds = true
        imgProfile.layer.cornerRadius = imgProfile.layer.frame.width/2
        
        imgProfile.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        imgProfile.layer.borderWidth = 0.1
        
        //나이
        viewAge.layer.masksToBounds = true
        viewAge.layer.cornerRadius = viewAge.layer.frame.width/2
        
        viewAge.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        viewAge.layer.borderWidth = 0.1
        
        //생일
        viewBirth.layer.masksToBounds = true
        viewBirth.layer.cornerRadius = viewBirth.layer.frame.width/2
        
        viewBirth.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        viewBirth.layer.borderWidth = 0.1
        
        //번호
        viewPhoneNum.layer.cornerRadius = 3
        viewPhoneNum.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        viewPhoneNum.layer.borderWidth = 1

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

    
    @IBAction func onDismiss(_ sender: UIButton) {
                self.dismiss(animated: true, completion: nil)
    }
    
}
