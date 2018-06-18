//
//  FriendsViewController.swift
//  Sopt22_seminar3
//
//  Created by 이혜진 on 2018. 4. 14..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 테이블 뷰
    @IBOutlet weak var profileTableView: UITableView!
    
    // 친구 프로필을 수정해주세요 : Model > ModelManager.swift 에서 해주세요
    var friends: [Profile] = ModelManager.sharedInstance.friends
    
    // 본인 프로필을 채워주세요
    var myProfile: Profile = Profile(name: "김예은", profileImage: #imageLiteral(resourceName: "pikachu8.jpeg"), phone: "010-0000-0000", age: 23, birthday: "00.00", message: "배켜니 짱ㅠ")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // 대리자(delegate)가 self인 것을 명시해주어야 합니다.
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        // 테이블 뷰에 내용이 나오지 않는 하단 부분의 선을 없애줍니다.
        profileTableView.tableFooterView = UIView(frame: .zero)
    
        
        // 테이블뷰의 스크롤 위에 새로고침이 되는 action을 추가합니다.
        profileTableView.refreshControl = UIRefreshControl()
        profileTableView.refreshControl?.addTarget(self, action: #selector(startReloadTableView(_:)), for: .valueChanged)
    }
    
    // refreshControl이 돌아갈 때 일어나는 액션
    @objc func startReloadTableView(_ sender: UIRefreshControl) {
        let friend1 = Profile(name: "11111111", profileImage: nil, message: nil)
        friends.append(friend1)
        profileTableView.reloadData()
        sender.endRefreshing()
    }
    
    
    // 테이블 뷰의 section이 몇 개인지 명시
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 테이블 뷰의 섹션안의 row가 몇 개인지 명시
    // numberOfRowsInSection : UITableViewDataSource의 필수 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return friends.count
        }
    }
    
    // 테이블 뷰의 section header(FriendsTableViewHeaderCell) 의 titleLabel에 들어갈 text
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewHeaderCell") as! FriendsTableViewHeaderCell
        
        if section == 0 {
            header.titleLabel.text = "내 프로필"
        } else {
            header.titleLabel.text = "친구"
        }
        
        return header
    }
    
    // 각 셀의 내용 추가
    // cellForRowAt : UITableViewDataSource의 필수 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseIdentifier) as! FriendsTableViewCell
        
        if indexPath.section == 0 {
            
            cell.nameLabel.text = myProfile.name
            cell.profileImageView.image = myProfile.profileImage ?? #imageLiteral(resourceName: "ic_male")
            cell.messageLabel.text = myProfile.message
            
            if myProfile.message == nil  {

                cell.messageLabel.isHidden = true
                cell.messageView.isHidden = true
            }
            
            else {
            
                cell.messageLabel.isHidden = false
                cell.messageView.isHidden = false
            }
            
            
        } else {
            
            cell.nameLabel.text = friends[indexPath.row].name
            cell.profileImageView.image = friends[indexPath.row].profileImage ?? #imageLiteral(resourceName: "ic_male")
            cell.messageLabel.text = friends[indexPath.row].message

            
            if friends[indexPath.row].message == nil {
                
                cell.messageView.isHidden = true
                cell.messageLabel.isHidden = true
                
            }
                
            else {
                
                
                cell.messageLabel.isHidden = false
                cell.messageView.isHidden = false
            }
            
        }
        
        return cell
    }
    
    // 테이블 뷰의 셀을 터치했을 때 일어나는 일
    // didSelectRowAt : UITableViewDelegate의 선택 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
        
        let datailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        datailVC.img = myProfile.profileImage ?? #imageLiteral(resourceName: "ic_male")
        datailVC.name = myProfile.name
        datailVC.phoneNum = myProfile.phone
        datailVC.age = String(myProfile.age)
        datailVC.birth = myProfile.birthday
        datailVC.message = gsno(myProfile.message)
        
        self.present(datailVC, animated: true, completion: nil)
        
        }
            
        else {
            
            let datailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

            datailVC.img = friends[indexPath.row].profileImage ?? #imageLiteral(resourceName: "ic_male")
            datailVC.name = friends[indexPath.row].name
            datailVC.phoneNum = friends[indexPath.row].phone
            datailVC.age = String(friends[indexPath.row].age)
            datailVC.birth = friends[indexPath.row].birthday
            datailVC.message = gsno(friends[indexPath.row].message)
            
            self.present(datailVC, animated: true, completion: nil)
            
        }
        
    }
    
    
}
