//
//  ViewController.swift
//  iOS_HW_01_1
//
//  Created by 김예은 on 2018. 4. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labFeel: UILabel!
    
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var btnJoy: UIButton!
    @IBOutlet weak var btnCrying: UIButton!
    @IBOutlet weak var btnAngry: UIButton!
    
    @IBOutlet weak var heartCnt: UILabel!
    @IBOutlet weak var joyCnt: UILabel!
    @IBOutlet weak var cryingCnt: UILabel!
    @IBOutlet weak var angryCnt: UILabel!

    var hCnt : Int = 0
    var jCnt : Int = 0
    var cCnt : Int = 0
    var aCnt : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labFeel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClick(_ sender: UIButton) {
        labFeel.isHidden = false
        
        if sender == btnHeart {
            btnHeart.isSelected = !btnHeart.isSelected
            
            if btnHeart.isSelected {

                labFeel.text = "사랑해요!"
                btnHeart.setImage(#imageLiteral(resourceName: "heart"), for: UIControlState.normal)
                hCnt = 1
                heartCnt.text = String(hCnt)
            }
            
            else {
                labFeel.text = ""
                btnHeart.setImage(#imageLiteral(resourceName: "heartEmpty"), for: UIControlState.normal)
                hCnt = 0
                heartCnt.text = String(hCnt)
            }
        }
        
        if sender == btnJoy {
            btnJoy.isSelected = !btnJoy.isSelected
            
            if btnJoy.isSelected {
                labFeel.text = "좋아요!"
                jCnt = 1
                joyCnt.text = String(jCnt)
            }
                
            else {
                labFeel.text = ""
                jCnt = 0
                joyCnt.text = String(jCnt)
            }
        }
        
        if sender == btnCrying {
            btnCrying.isSelected = !btnCrying.isSelected
            
            if btnCrying.isSelected {
                labFeel.text = "슬퍼요ㅠㅠ"
                cCnt = 1
                cryingCnt.text = String(cCnt)
            }
            
            else {
                labFeel.text = ""
                cCnt = 0
                cryingCnt.text = String(cCnt)

            }
        }
        
        if sender == btnAngry {
            btnAngry.isSelected = !btnAngry.isSelected
            
            if btnAngry.isSelected {
                labFeel.text = "화나요ㅡㅅㅡ"
                aCnt = 1
                angryCnt.text = String(aCnt)
            }
            
            else {
                labFeel.text = ""
                aCnt = 0
                angryCnt.text = String(aCnt)
            }
        }
    }
}


    


