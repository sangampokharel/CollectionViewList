//
//  InstagramStoryCollectionViewCell.swift
//  CollectionViewList
//
//  Created by sangam pokharel on 02/04/2024.
//

import UIKit

class InstagramStoryCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "InstagramStoryCollectionViewCell"
    static func nib()->UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var containerView:UIView! {
        didSet{
            containerView.layer.cornerRadius = 80 / 2
            containerView.layer.borderWidth = 2
            containerView.layer.borderColor = UIColor.link.cgColor
            containerView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var imageView:UIImageView!{
        didSet {
            imageView.layer.cornerRadius = 70 / 2
            imageView.clipsToBounds = true
            imageView.layer.masksToBounds = true
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withImage:String){
        imageView.image = UIImage(named: withImage)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}
