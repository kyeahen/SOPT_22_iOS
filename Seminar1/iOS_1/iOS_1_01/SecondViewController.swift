//
//  SecondViewController.swift
//  iOS_1_01
//
//  Created by 김예은 on 2018. 3. 31..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //연결 후에 이름 바꾸면 안된다 => 앱이 터짐!

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var tvText1: UITextField!
    @IBOutlet weak var tvText2: UITextField!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedName(_ sender: Any) {
        label1.text = tvText1.text
    }
    
    @IBAction func pressedPart(_ sender: Any) {
        if tvText2.text == "iOS" ||
            tvText2.text=="Android" ||
            tvText2.text == "web" ||
            tvText2.text == "server" {
            imgView.image = UIImage(named:"image03")
        }
            
        else if tvText2.text == "기획" {
            imgView.image = #imageLiteral(resourceName: "image01")
        }
            
        else  {
            imgView.image = #imageLiteral(resourceName: "image02")
        }
    }
    
    @IBAction func frameMove(_ sender: UIButton) {
        
        if sender == btnRight
        {
            imgView.frame.origin.x += 10.0
        }
        
        if sender == btnLeft
        {
            imgView.frame.origin.x -= 10.0
        }

    }
        
}
    

