//
//  ViewController.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 21/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let colors: [UIColor] = [.red, .green, .blue, .orange, .purple, .black, .white, .cyan]
    let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
    let favoritesItem = UITabBarItem(title: "Favoritos", image: UIImage(named: "favorites"), tag: 1)
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        configHierarchy()
        configConstraints()
        updateNavigationBar(font: UIFont.boldSystemFont(ofSize: 20), color: .white)
        tabBarItems()
    }
    
    func updateNavigationBar(font: UIFont, color: UIColor) {
        navigationItem.title = "globoplay"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    
    //MARK: - Properties
    
    let tabBar = UITabBar()
    
    func tabBarItems() {
        tabBar.delegate = self
        tabBar.setItems([homeItem, favoritesItem], animated: false)
        tabBar.barTintColor = .black
    }
    
    private lazy var labelTitleNovel: UILabel = {
        let labelTitleNovel = UILabel()
        labelTitleNovel.text = "Novelas"
        labelTitleNovel.textColor = .black
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
        collectionView.backgroundColor = .lightGray
        collectionView.register(NovelCollectionViewCell.self, forCellWithReuseIdentifier: "novelCell")
        
        return collectionView
    }()
    
    private lazy var labelTitleSeries: UILabel = {
        let labelTitleSeries = UILabel()
        labelTitleSeries.text = "Séries"
        labelTitleSeries.textColor = .black
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
        collectionView.backgroundColor = .lightGray
        collectionView.register(NovelCollectionViewCell.self, forCellWithReuseIdentifier: "novelCell")
        
        return collectionView
    }()
    
    private lazy var labelTitleCine: UILabel = {
        let labelTitleSeries = UILabel()
        labelTitleSeries.text = "Cinema"
        labelTitleSeries.textColor = .black
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
        collectionView.backgroundColor = .lightGray
        collectionView.register(NovelCollectionViewCell.self, forCellWithReuseIdentifier: "novelCell")
        
        return collectionView
    }()
    
    
    // MARK: - Constraints
    
    private func configHierarchy(){
        view.addSubview(labelTitleNovel)
        view.addSubview(collectionViewNovel)
        view.addSubview(labelTitleSeries)
        view.addSubview(collectionViewSeries)
        view.addSubview(labelTitleCine)
        view.addSubview(collectionViewCine)
        view.addSubview(tabBar)
    }
    
    private func configConstraints(){
        addConstraintsLabelTitleNovel()
        addConstraintsCollectionViewNovel()
        addConstraintsLabelTitleSeries()
        addConstraintsCollectionViewSeries()
        addConstraintsLabelTitleCine()
        addConstraintsCollectionViewCine()
        addConstraintsTabBar()
        
    }
    
    private func addConstraintsLabelTitleNovel() {
        NSLayoutConstraint.activate([
            labelTitleNovel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            labelTitleNovel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
    
    private func addConstraintsCollectionViewNovel() {
        NSLayoutConstraint.activate([
            collectionViewNovel.topAnchor.constraint(equalTo: labelTitleNovel.bottomAnchor, constant: 10),
            collectionViewNovel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionViewNovel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewNovel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func addConstraintsLabelTitleSeries() {
        NSLayoutConstraint.activate([
            labelTitleSeries.topAnchor.constraint(equalTo: collectionViewNovel.bottomAnchor, constant: 35),
            labelTitleSeries.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
    
    private func addConstraintsCollectionViewSeries() {
        NSLayoutConstraint.activate([
            collectionViewSeries.topAnchor.constraint(equalTo: labelTitleSeries.bottomAnchor, constant: 10),
            collectionViewSeries.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionViewSeries.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewSeries.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func addConstraintsLabelTitleCine() {
        NSLayoutConstraint.activate([
            labelTitleCine.topAnchor.constraint(equalTo: collectionViewSeries.bottomAnchor, constant: 35),
            labelTitleCine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    private func addConstraintsCollectionViewCine() {
        NSLayoutConstraint.activate([
            collectionViewCine.topAnchor.constraint(equalTo: labelTitleCine.bottomAnchor, constant: 10),
            collectionViewCine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionViewCine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewCine.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func addConstraintsTabBar() {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

//MARK: - Extensions UICollectionViewDelegate, UICollectionViewDataSource and UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "novelCell", for: indexPath) as? NovelCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageNovel.image = UIImage(named: "splash")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 100.0
        let height: CGFloat = 150.0
        return CGSize(width: width, height: height)
    }
}
//MARK: - Extensions UITabBarDelegate

extension HomeViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            // Lógica para lidar com a seleção da opção "Home"
        } else if item.tag == 1 {
            let favoritesViewController = FavoritesViewController()
            favoritesViewController.title = "Minha Lista"
            self.navigationController?.pushViewController(favoritesViewController, animated: true)
        }
    }
}


#Preview("HomeViewController") {
    HomeViewController()
}
