//
//  NovelCollectionViewCell.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 21/06/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    lazy var imageNovel: UIImageView = {
        let imageNovel = UIImageView()
        imageNovel.translatesAutoresizingMaskIntoConstraints = false
        imageNovel.backgroundColor = .blue
        return imageNovel
    }()
    
    // MARK: - Methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageNovel.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageNovel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageNovel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageNovel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupCell(_ image: UIImage){
        imageNovel.image = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageNovel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

