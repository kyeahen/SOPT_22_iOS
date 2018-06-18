//
//  WriteContentViewController.swift
//  Sopt22_seminar4
//
//  Created by 이혜진 on 2018. 4. 30..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WriteContentViewController: UIViewController, UITextFieldDelegate {
    
    let userdefault = UserDefaults.standard

    @IBOutlet weak var tfTitle: UITextField! { didSet{ tfTitle.delegate = self}}
    @IBOutlet weak var tvContent: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    var pwd : String = ""
    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    
    var boards: [Board] = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.isUserInteractionEnabled = true // 터치 이벤트를 감지하기 위해서
    }
    
    // 화면 터치하면 키보드 내려가는 함수
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

        self.view.endEditing(true)
    }
    
    // 리턴 버튼 클릭시 키보드 내려가는 함수
    func textFieldShouldReturn(_ tfTitle: UITextField) -> Bool {
        tfTitle.resignFirstResponder()
        return true
    }
    
    // MARK: 액션(글 등록)
    @IBAction func onSave(_ sender: UIBarButtonItem) {

        if tfTitle.text?.isEmpty == true || tvContent.text.isEmpty == true {
            let dialog = UIAlertController(title: "글 등록 실패", message: "모든 항목을 입력하세요", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
            
            dialog.addAction(action)
            
            self.present(dialog, animated: true, completion: nil)
        }
        
        else {
            let dialog = UIAlertController(title: "글 등록 실패", message: "모든 항목을 입력하세요", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "확인", style: .default) {(action) in
                self.pwd = dialog.textFields![0].text!
                self.saveContent(title: self.tfTitle.text!, content: self.tvContent.text, password: self.pwd)
            }
            
            dialog.addTextField()
            
            dialog.addAction(action)
            
            self.present(dialog, animated: true, completion: nil)
            
        }
    }
    
    // MARK: 액션(이미지 피커)
    @IBAction func openImagePicker(_ sender: UITapGestureRecognizer) {
        openGallery()
    }
    
    // MARK: 글 저장(create)
    func saveContent(title: String, content: String, password: String) {
        if let image = img.image { //이미지가 있을 때
            BoardService.savePhotoContent(title: title, content: content, password: password, photo: image) {
                self.navigationController?.popViewController(animated: true)
            }
        }
            
        else { //이미지가 없을 때
            BoardService.saveContent(title: title, content: content, password: password) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

//    func saveContent(title: String, content: String) {
//        let URL = "http://13.125.118.111:3009/board"
//
//        let body: [String: Any] = [
//            "user_id" : gsno(userdefault.string(forKey: "nickName")), //값이 있으면 값이 나오고 없으면 default 값이 나온다. 옵셔널값 푸는 것
//            "board_title" : title,
//            "board_content" : content,
//            "board_pw" : "11"
//        ]
//
//        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData() { res in
//            switch res.result {
//            case .success:
//                //////// 직접 구현해보세요. ////////
//
//                if let value = res.result.value {
//                    self.navigationController?.popViewController(animated: true)
//
//                }
//                break
//
//
//            case .failure(let err):
//                print(err.localizedDescription)
//                break
//            }
//        }
//    }

}

// MARK: 이미지 첨부
extension WriteContentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Method
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.delegate = self
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    // imagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("사용자가 취소함")
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //        defer {
        //            self.dismiss(animated: true) {
        //                print("이미지 피커 사라짐")
        //            }
        //        }
        
        if let editedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            img.image = editedImage
        } else if let originalImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            img.image = originalImage
        }
        
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
}


