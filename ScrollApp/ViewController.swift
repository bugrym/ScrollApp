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
        self.view.addSubview(collection)
        collection.dataSource = self
        collection.delegate = self 
        collection.backgroundColor = .red
        collection.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseID)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: collection, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: collection, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: collection, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: collection, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as! Cell
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}

