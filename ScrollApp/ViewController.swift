//
//  ViewController.swift
//  ScrollApp
//
//  Created by vbugrym on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {

    private var collection: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setupUI()
    }
    
    func setupUI() {
        guard let collection = collection else { return }
        self.view.addSubview(collection)
        collection.backgroundColor = .red
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: collection, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: collection, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: collection, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: collection, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
}

