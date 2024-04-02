//
//  FirstCollectionViewCell.swift
//  CollectionViewList
//
//  Created by sangam pokharel on 02/04/2024.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    static let identifier = "FirstCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var imageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with image:String){
        imageView.image = UIImage(named: image)
    }

}
