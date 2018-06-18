//
//  BoardViewController.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 6. 13..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyJSON
import Alamofire

class BoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var boards: [Board] = [Board]()


    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        
        boardInit()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func boardInit() {
        BoardService.boardInit{ (boardData) in
            self.boards = boardData
            self.boardCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCollectionViewCell.reuseIdentifier, for: indexPath) as! BoardCollectionViewCell
        
        cell.boardImageView.kf.setImage(with: URL(string: gsno(boards[indexPath.row].board_photo)), placeholder: UIImage())
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd HH:mm"
        cell.dateLabel.text = dateFormatter.string(from: boards[indexPath.row].board_writetime)

        cell.titleLabel.text = boards[indexPath.row].board_title
        
        cell.userIDLabel.text = boards[indexPath.row].user_id
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let boardDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: BoardDetailTableViewController.reuseIdentifier) as! BoardDetailTableViewController
        
        boardDetailVC.img = gsno(boards[indexPath.row].board_photo)
        boardDetailVC.titleName = gsno(boards[indexPath.row].board_title)
        boardDetailVC.date = boards[indexPath.row].board_writetime
        boardDetailVC.idx = boards[indexPath.row].board_idx
        boardDetailVC.content = gsno(boards[indexPath.row].board_content)
        boardDetailVC.nickName = gsno(boards[indexPath.row].user_id)
        
        self.navigationController?.pushViewController(boardDetailVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInterItemSpacingForSelectionAt: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingSelectionAt: Int) -> CGFloat {
        return 5
    }
    


}
