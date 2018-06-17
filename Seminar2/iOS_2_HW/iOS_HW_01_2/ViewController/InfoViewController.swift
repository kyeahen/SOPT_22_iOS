//
//  InfoViewController.swift
//  iOS_HW_01_2
//
//  Created by 김예은 on 2018. 4. 27..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var imgGender: UIImageView!
    @IBOutlet weak var textName: UILabel!
    @IBOutlet weak var textBirth: UILabel!
    @IBOutlet weak var textID: UILabel!
    @IBOutlet weak var textPWD: UILabel!
    @IBOutlet weak var textPartInfo: UILabel!
    
    var gender : String? = ""
    var name : String? = ""
    var birth : String? = ""
    var id : String? = ""
    var pwd : String? = ""
    var partInfo : String? = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (gender == "man") {
            imgGender.image = #imageLiteral(resourceName: "man_blue")
        }
        if (gender == "woman"){
            imgGender.image = #imageLiteral(resourceName: "woman_red")
        }
        
        textName.text = name
        textBirth.text = birth
        textID.text = id
        textPWD.text = pwd
        textPartInfo.text = partInfo

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func logoutAction(_ sender: UIButton) {
        

        let dialog = UIAlertController(title: "로그아웃", message: "정말로 떠나시겠습니까?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: UIAlertActionStyle.default){ (action: UIAlertAction) -> Void in
            
            self.performSegue(withIdentifier: "logout", sender: self)
            
        }
        
        let cancel = UIAlertAction(title: "취소", style: UIAlertActionStyle.default)
        
        dialog.addAction(ok)
        dialog.addAction(cancel)
        
        
        self.present(dialog, animated: true, completion: nil)
        
        
    }
    
    

}
