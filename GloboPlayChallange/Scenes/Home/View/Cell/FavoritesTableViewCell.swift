//
//  FavoritesTableViewCell.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 22/06/23.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
