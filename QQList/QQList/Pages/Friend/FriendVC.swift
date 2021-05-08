//
//  FriendVC.swift
//  QQList
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit

class FriendVC: UITableViewController {
    
    private var listData: [FriendItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...8 {
            listData.append([
                FriendItem(title: "亲人", num: "1/10"),
                FriendItem(title: "大学同学", num: "6/24"),
                FriendItem(title: "朋友", num: "15/36")
            ][i % 3])
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kFriendCellID, for: indexPath) as! FriendCell
        cell.info = listData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = listData[indexPath.row]
        
        let alert = UIAlertController(title: "标题", message: "你点击了: \(item.title)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("ok")
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

}
