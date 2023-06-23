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
        return imageNovel
    }()
    
    
    // MARK: - Methods
    
    func setupCell(movie: Result ){
//        imageNovel.image = movie.posterPath
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageNovel.heightAnchor.constraint(equalToConstant: 100),
            imageNovel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .red
//        contentView.addSubview(imageNovel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

