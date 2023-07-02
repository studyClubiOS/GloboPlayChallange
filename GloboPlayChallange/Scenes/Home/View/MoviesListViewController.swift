//
//  ViewController.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 21/06/23.
//

import UIKit

class MoviesListViewController: UIViewController {
        
    var service = ServiceAPI()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configHierarchy()
        configConstraints()
        updateNavigationBar(font: UIFont.boldSystemFont(ofSize: 20), color: .white)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadMovies()
    }
    
    //MARK: - Properties
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var labelTitleNovel: UILabel = {
        let labelTitleNovel = UILabel()
        labelTitleNovel.text = "Novelas"
        labelTitleNovel.textColor = .white
        labelTitleNovel.font = .systemFont(ofSize: 18, weight: .semibold)
        labelTitleNovel.translatesAutoresizingMaskIntoConstraints = false
        return labelTitleNovel
    }()
    
    private lazy var collectionViewNovel: UICollectionView = {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 10
        collectionViewLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "novelCell")
        
        return collectionView
    }()
    
    // MARK: - Constraints
    private func configHierarchy(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(labelTitleNovel)
        contentView.addSubview(collectionViewNovel)
    }
    
    private func configConstraints(){
        addConstraintsScrollView()
        addConstraintsContentView()
        addConstraintsLabelTitleNovel()
        addConstraintsCollectionViewNovel()
    }
    
    private func addConstraintsScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func addConstraintsContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
    }
    
    private func addConstraintsLabelTitleNovel() {
        NSLayoutConstraint.activate([
            labelTitleNovel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelTitleNovel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
    
    private func addConstraintsCollectionViewNovel() {
        NSLayoutConstraint.activate([
            collectionViewNovel.topAnchor.constraint(equalTo: labelTitleNovel.bottomAnchor, constant: 10),
            collectionViewNovel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionViewNovel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionViewNovel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // MARK: - Methods
    func updateNavigationBar(font: UIFont, color: UIColor) {
        navigationItem.title = "globoplay"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    func reloadMovies() {
        service.getRequestMovie { movies, error in
            guard let movies else { return }
            MovieModel.movieList = movies
            self.collectionViewNovel.reloadData()
        }
    }
}

//MARK: - Extensions UICollectionViewDelegate, UICollectionViewDataSource and UICollectionViewDelegateFlowLayout
extension MoviesListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieModel.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "novelCell", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let movie = MovieModel.movieList[indexPath.row]
        if let posterPath = movie.posterPath {
            service.getImageFromBackdropPath(posterPath: posterPath) { data, error in
                guard let data else { return }
                guard let image = UIImage(data: data) else { return }
                cell.setupCell(image)
                cell.setNeedsLayout()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 100.0
        let height: CGFloat = 150.0
        return CGSize(width: width, height: height)
    }
}

//
//#Preview("HomeViewController") {
//    MoviesListViewController()
//}
