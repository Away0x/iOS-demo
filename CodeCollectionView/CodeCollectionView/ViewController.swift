//
//  ViewController.swift
//  CodeCollectionView
//
//  UICollectionView Programmatically
// 
//  Created by 吴彤 on 2021/4/24.
//

import UIKit

let kCell = "cell"

class ViewController: UIViewController {
    
    private let photos = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.scrollDirection = .horizontal
        
        // frame 设为 zero，使用 autolayout 布局
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false // autolayout 才会生效，否则布局会以 frame 为基准
        
        cv.backgroundColor = .systemBackground
        cv.register(Cell.self, forCellWithReuseIdentifier: kCell)
        cv.dataSource = self
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        setUI()
    }
    
    private func setUI() {
        // 有两种 autolayout 的方式
        // 1
        // NSLayoutConstraint.activate([
        //     collectionView.heightAnchor.constraint(equalTo: 90)
        // ])
        
        // 2
        // 顶部距离 safe area 的 top 16
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }

}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCell, for: indexPath) as! Cell
        
        cell.imageView.image = photos[indexPath.item]
        
        return cell
    }
}
