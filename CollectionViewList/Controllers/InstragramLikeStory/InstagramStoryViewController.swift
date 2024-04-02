//
//  InstagramStoryViewController.swift
//  CollectionViewList
//
//  Created by sangam pokharel on 02/04/2024.
//

import UIKit

class InstagramStoryViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    private var models:[String] = Array(1...20).compactMap { _ in
        "person1"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
    }
    
    private func setUpCollectionView(){
        collectionView.register(InstagramStoryCollectionViewCell.nib(), forCellWithReuseIdentifier: InstagramStoryCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
}

extension InstagramStoryViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InstagramStoryCollectionViewCell.identifier, for: indexPath) as! InstagramStoryCollectionViewCell
        cell.configure(withImage: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
