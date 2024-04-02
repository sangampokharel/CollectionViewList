//
//  FooterCollectionReusableView.swift
//  CollectionViewList
//
//  Created by sangam pokharel on 02/04/2024.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "FooterCollectionReusableView"
    
    private var contentView:UIView = {
       let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    func configure() {
        backgroundColor = .systemGreen
    }
}
