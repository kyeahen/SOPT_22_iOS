//
//  ThirdViewController.swift
//  Sopt22_seminar2
//
//  Created by 이혜진 on 2018. 4. 7..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 확인 버튼만 있는 알림.
    @IBAction func alert1(_ sender: Any) {
        let alert = UIAlertController(title: "타이틀", message: "내용", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(doneButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // 확인과 취소가 있는 알림.
    @IBAction func alert2(_ sender: Any) {
        let alert = UIAlertController(title: "타이틀", message: "내용", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(doneButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // 세미나 때 진행하지 않은 부분 입니다. 확인해보세요.
    @IBAction func actionsheet(_ sender: Any) {
        let alert = UIAlertController(title: "타이틀", message: "내용", preferredStyle: .actionSheet) ///// ActionSheet
        let contentButton = UIAlertAction(title: "내용1", style: .default, handler: nil)
        let contentButton2 = UIAlertAction(title: "내용2", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(contentButton)
        alert.addAction(contentButton2)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // Unwind
    @IBAction func goFirstAction(_ sender: Any) {
        self.performSegue(withIdentifier: "logout", sender: self)
    }
}

// 아래와 같이 UIViewController에 확장한다면 모든 ViewController에서 alert를 띄울 수 있게 됩니다.
extension UIViewController {
    func addAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(doneButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}
