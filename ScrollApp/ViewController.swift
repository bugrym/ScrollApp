//
//  ViewController.swift
//  ScrollApp
//
//  Created by vbugrym on 26.01.2023.
//

import UIKit

class Cell: UICollectionViewCell {
    static let reuseID = "Cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class ViewController: UIViewController {

    private var collection: UICollectionView!
    private var dataSource: Int = 0 {
        didSet {
//            collection.reloadData()
//            let indexPath = IndexPath(item: dataSource - 1, section: 0)
//            collection.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
    
    private lazy var addBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Add Item", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(addBtnTap), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        setupUI()
    }
    
    func setupUI() {
        guard let collection = collection else { return }
        self.view.addSubview(addBtn)
        self.view.addSubview(collection)
        
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .red
        collection.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseID)
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: addBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 56).isActive = true
        NSLayoutConstraint(item: addBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 56 * 2.5).isActive = true
        NSLayoutConstraint(item: addBtn, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: addBtn, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 60).isActive = true
        
        
        NSLayoutConstraint(item: collection, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: collection, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: collection, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: collection, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    @objc private
    func addBtnTap() {
        dataSource += 1
        
        collection.reloadData()
        let indexPath = IndexPath(item: dataSource - 1, section: 0)
        collection.scrollToItem(at: indexPath, at: .right, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as! Cell
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSource -= 1
        
        UIView.animate(withDuration: 0.5) { [weak collectionView] in
            collectionView?.deleteItems(at: [indexPath])
        }
    }
}

