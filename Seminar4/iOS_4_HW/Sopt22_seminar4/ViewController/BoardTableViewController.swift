//
//  BoardTableViewController.swift
//  Sopt22_seminar4
//
//  Created by 이혜진 on 2018. 4. 30..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class BoardTableViewController: UITableViewController {
    
    var boards: [Board] = [Board]()
    
    override func viewWillAppear(_ animated: Bool) {
        boardInit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardInit()
    }
    
    
    // MARK: 게시판 조회
    func boardInit() {
        BoardService.boardInit { (boardData) in
            self.boards = boardData
            self.tableView.reloadData()
        }
    }
//    func boardInit() {
//        let URL = "http://13.125.118.111:3009/board"
//
//        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in //변수명
//            switch res.result { //통신이 되었냐 안되었냐가 나온다"?{
//            case .success:
//
//                if let value = res.result.value {
//
//                    //////// Codable /////////
//                    //목적 : 서버랑 클라랑 데이터를 주고 받을 때, 내가 자동으로 오면서 메세지라는 키로 오는 것은 메세지에 담아주고, data라는 키로 오는 것은 데이터에 담아주고 그러한 과정
//                    let decoder = JSONDecoder()
//
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
//
//                    do {
//                        let boardData = try decoder.decode(BoardData.self, from: value)
//
//                        if boardData.message == "Successful Get Board Data" {
//                            self.boards = boardData.data //디코드해서 받아온 데이터
//                            self.tableView.reloadData()
//                        }
//
//                    } catch {
//
//                    }
//                    //////////////////
//                }
//
//                break
//            case .failure(let err):
//                print(err.localizedDescription)
//                break
//            }
//        }
//    }
    
    
    // MARK: *테이블 뷰*
    
    // MARK: numberOfRowInSection
    // 몇 개의 row가 들어갈지
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boards.count
    }
    
    // MARK: cellForRowAt
    // row에 어떤 데이터가 들어갈지
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.reuseIdentifier, for: indexPath) as! BoardTableViewCell
        
        cell.nickNameLabel.text = boards[indexPath.row].user_id
        cell.titleLabel.text = boards[indexPath.row].board_title
        cell.contentLabel.text = boards[indexPath.row].board_content
        
        // 받은 날짜를 원하는 포맷에 맞춰 수정
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        //let date = dateFormatter.date(from: boards[indexPath.row].board_writetime)
        dateFormatter.dateFormat = "MM/dd HH:mm"
        
        //cell.dateLabel.text = dateFormatter.string(from: date!)
        cell.dateLabel.text = dateFormatter.string(from: boards[indexPath.row].board_writetime)
        
        // 이미지 받기
        // with : 이미지 경로
        // placeholder : 경로가 null일 때 기본으로 뜨게 할 이미지(UIImage 타입)
        //url로 오는 이미지를 이미지화 시켜야 함
        //킹피셔 = 자동으로 이미지뷰에 이미지를 넣어쥼
        cell.contentImageView.kf.setImage(with: URL(string: gsno(boards[indexPath.row].board_photo)), placeholder: UIImage())
        
        return cell
    }
    
    // MARK: didSelectRowAt
    // 셀을 클릭했을 때 무슨 일을 할 것인지
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let boardDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BoardDetailTableViewController") as! BoardDetailTableViewController
    
        boardDetailVC.titleName = boards[indexPath.row].board_title!
        boardDetailVC.content = boards[indexPath.row].board_content!
        boardDetailVC.date = boards[indexPath.row].board_writetime
       
        boardDetailVC.nickName = boards[indexPath.row].board_title!
        boardDetailVC.idx = boards[indexPath.row].board_idx
        boardDetailVC.img = gsno(boards[indexPath.row].board_photo)
        
        self.navigationController?.pushViewController(boardDetailVC, animated: true)
    
    }
    
    
}
