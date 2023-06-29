//
//  ViewController.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 21/06/23.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    private var movies: [ResultMovie] = []
    
    private var moviesListViewModel = MovieListViewModel()
    var service = ServiceAPI()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configHierarchy()
        configConstraints()
        updateNavigationBar(font: UIFont.boldSystemFont(ofSize: 20), color: .white)
//        service.delegate = self
        service.getRequestMovie()
        moviesListViewModel.fetchMovies()
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
    
    private lazy var labelTitleSeries: UILabel = {
        let labelTitleSeries = UILabel()
        labelTitleSeries.text = "Séries"
        labelTitleSeries.textColor = .white
        labelTitleSeries.font = .systemFont(ofSize: 18, weight: .semibold)
        labelTitleSeries.translatesAutoresizingMaskIntoConstraints = false
        return labelTitleSeries
    }()
    
    private lazy var collectionViewSeries: UICollectionView = {
        
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
    
    private lazy var labelTitleCine: UILabel = {
        let labelTitleSeries = UILabel()
        labelTitleSeries.text = "Cinema"
        labelTitleSeries.textColor = .white
        labelTitleSeries.font = .systemFont(ofSize: 18, weight: .semibold)
        labelTitleSeries.translatesAutoresizingMaskIntoConstraints = false
        return labelTitleSeries
    }()
    
    private lazy var collectionViewCine: UICollectionView = {
        
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
        contentView.addSubview(labelTitleSeries)
        contentView.addSubview(collectionViewSeries)
        contentView.addSubview(labelTitleCine)
        contentView.addSubview(collectionViewCine)
    }
    
    private func configConstraints(){
        addConstraintsScrollView()
        addConstraintsContentView()
        addConstraintsLabelTitleNovel()
        addConstraintsCollectionViewNovel()
        addConstraintsLabelTitleSeries()
        addConstraintsCollectionViewSeries()
        addConstraintsLabelTitleCine()
        addConstraintsCollectionViewCine()
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
    
    private func addConstraintsLabelTitleSeries() {
        NSLayoutConstraint.activate([
            labelTitleSeries.topAnchor.constraint(equalTo: collectionViewNovel.bottomAnchor, constant: 35),
            labelTitleSeries.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
    
    private func addConstraintsCollectionViewSeries() {
        NSLayoutConstraint.activate([
            collectionViewSeries.topAnchor.constraint(equalTo: labelTitleSeries.bottomAnchor, constant: 10),
            collectionViewSeries.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionViewSeries.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionViewSeries.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func addConstraintsLabelTitleCine() {
        NSLayoutConstraint.activate([
            labelTitleCine.topAnchor.constraint(equalTo: collectionViewSeries.bottomAnchor, constant: 35),
            labelTitleCine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    private func addConstraintsCollectionViewCine() {
        NSLayoutConstraint.activate([
            collectionViewCine.topAnchor.constraint(equalTo: labelTitleCine.bottomAnchor, constant: 10),
            collectionViewCine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionViewCine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionViewCine.heightAnchor.constraint(equalToConstant: 150)
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
}

//MARK: - Extensions UICollectionViewDelegate, UICollectionViewDataSource and UICollectionViewDelegateFlowLayout
extension MoviesListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesListViewModel.numberOfMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "novelCell", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        let movieViewModel = moviesListViewModel.movieViewModel(at: indexPath.row)
        movieViewModel.configure(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 100.0
        let height: CGFloat = 150.0
        return CGSize(width: width, height: height)
    }
}

extension MoviesListViewController: ServiceAPIDelegate {
    func didFetchImageData(_ image: UIImage) {
        DispatchQueue.main.async {
            self.collectionViewNovel.reloadData()
        }
    }
}

//
//#Preview("HomeViewController") {
//    MoviesListViewController()
//}
