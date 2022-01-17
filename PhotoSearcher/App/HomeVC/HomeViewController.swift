//
//  ViewController.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 12.01.22.
//

import UIKit
import Kingfisher

final class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    private let searchBar = UISearchBar()
    private let networkMethod = NetworkMethods()
    private var searchResult: [MainModel] = []
    private var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        loadRandomPhotos()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSearchBar()
        setupCollectionView()
        
    }
    
    //MARK: - RandomPhotosMethod
    func loadRandomPhotos() {
        searchResult = []
        networkMethod.loadRandomPhotos() {jsonResult in
            DispatchQueue.main.async {
                self.searchResult = jsonResult
                self.collectionView?.reloadData()
            }
        }
    }
    
    //MARK: - SearchBarButtonAction
    
    func  searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            searchResult = []
            collectionView?.reloadData()
            networkMethod.searchPhoto(query: text) {jsonResult in
                DispatchQueue.main.async {
                    self.searchResult = jsonResult.results ?? []
                    self.collectionView?.reloadData()
                }
                
            }
        }
    }
}

//MARK: -SetupUI
extension HomeViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top,
                                 width: view.frame.size.width-20,
                                 height: 40)
        searchBar.barStyle = .default
        searchBar.tintColor = .black
        searchBar.placeholder = "input text"
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .green
        
        view.addSubview(searchBar)
    }
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2,
                                 height: view.frame.size.width/2)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        self.collectionView = collectionView
        collectionView.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55,
                                      width: view.frame.size.width,
                                      height: view.frame.size.height-55)
        view.addSubview(collectionView)
        
    }
}

//MARK: - CollectionViewMethods

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        imageURL = ""
        imageURL = searchResult[indexPath.row].urls?.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell ()
        }
        cell.configure(with: imageURL ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userFirstName = searchResult[indexPath.item].user?.first_name
        let userLastName = searchResult[indexPath.item].user?.last_name
        let userFullName = (userFirstName ?? "") + " " + (userLastName ?? "")
        let dateUpdated = searchResult[indexPath.item].user?.updated_at
        let location = searchResult[indexPath.item].location?.name
        let loads = "\(searchResult[indexPath.item].downloads ?? 0)"
        let fullImageURL = searchResult[indexPath.item].urls?.regular
        
        guard let urlString = fullImageURL else { return }
        let controller = InfoViewController(imageUrlString: urlString, userName: userFullName)
        controller.userNameLabelText = userFullName
        controller.dateLabelText = dateUpdated
        controller.locationLabelText = location
        controller.downloadsLabelText = loads
        
        present(controller, animated: true, completion: nil)
    
    }
    
}


