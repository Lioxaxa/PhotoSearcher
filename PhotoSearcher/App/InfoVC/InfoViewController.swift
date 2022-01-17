//
//  InfoViewController.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 13.01.22.
//

import UIKit

final class InfoViewController: UIViewController, UITableViewDelegate {
    
    private let imageString: String
    var fullSizeImage = UIImageView()
    var image: UIImage?
    var userNameLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    var downloadsLabel = UILabel()
    var userNameLabelText: String
    var dateLabelText: String?
    var locationLabelText: String?
    var downloadsLabelText: String?
    
    private let addToFavButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.7659371495, green: 0.8488077521, blue: 0.4356547296, alpha: 1)
        button.setTitle("Add to favorite", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.tintColor = UIColor.black
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(addToFavButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let deleteFromFavButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.setTitle("Delete from favorite", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.tintColor = UIColor.black
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(deleteFromFavButtonAction), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    init(imageUrlString: String, userName: String) {
        imageString = imageUrlString
        userNameLabelText = userName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Image URL has not been implemented")
    }
    var dataSourceImages: [String] {
        return UserDefaults.getFavoritesImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dataSourceImages.contains(where: {$0 == imageString }){
            addToFavButton.isHidden = true
            deleteFromFavButton.isHidden = false
        }
        
        setUI()
    }
    
    //MARK: - SetUI
    private func setUI() {
        self.view.backgroundColor = .lightGray
        fullSizeImage.kf.setImage(with: URL(string: imageString))
        fullSizeImage.clipsToBounds = true
        fullSizeImage.contentMode = .scaleAspectFill
        fullSizeImage.frame = CGRect(x: 5, y: 5,
                                     width: self.view.frame.width - 10,
                                     height: self.view.frame.height/2 - 20)
        view.addSubview(fullSizeImage)
        
        userNameLabel.frame.size = CGSize(width: 250, height: 30)
        userNameLabel.center = view.center
        userNameLabel.textAlignment = .center
        userNameLabel.text = "Author: " + (userNameLabelText )
        self.view.addSubview(userNameLabel)
        
        dateLabel.frame.size = CGSize(width: 250, height: 30)
        dateLabel.textAlignment = .center
        dateLabel.center.x = userNameLabel.center.x
        dateLabel.center.y = userNameLabel.center.y + 40
        dateLabel.text = "Date: " + (dateLabelText?.maxLength(length: 10) ?? " ")
        self.view.addSubview(dateLabel)
        
        locationLabel.frame.size = CGSize(width: 250, height: 30)
        locationLabel.textAlignment = .center
        locationLabel.center.x = dateLabel.center.x
        locationLabel.center.y = dateLabel.center.y + 40
        locationLabel.text = "Location: " + (locationLabelText ?? "not specified")
        self.view.addSubview(locationLabel)
        
        downloadsLabel.frame.size = CGSize(width: 250, height: 30)
        downloadsLabel.textAlignment = .center
        downloadsLabel.center.x = locationLabel.center.x
        downloadsLabel.center.y = locationLabel.center.y + 40
        downloadsLabel.text = "Downloads: " + (downloadsLabelText ?? " ")
        self.view.addSubview(downloadsLabel)
        
        addToFavButton.frame.size = CGSize(width: 250, height: 40)
        addToFavButton.center.x = downloadsLabel.center.x
        addToFavButton.center.y = downloadsLabel.center.y + 60
        
        deleteFromFavButton.frame.size = CGSize(width: 250, height: 40)
        deleteFromFavButton.center.x = downloadsLabel.center.x
        deleteFromFavButton.center.y = downloadsLabel.center.y + 60
        
        self.view.addSubview(addToFavButton)
        self.view.addSubview(deleteFromFavButton)
        
    }
    //MARK: - Button's Action's
    @objc private func addToFavButtonAction() {
        UserDefaults.addToFavoritesImage(urlString: imageString)
        UserDefaults.addToFavoritesName(userName: userNameLabelText)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .favoritesChanged, object: nil)
            self.addToFavButton.isHidden = true
            self.deleteFromFavButton.isHidden = false
        }
        
    }
    
    @objc private func deleteFromFavButtonAction() {
        UserDefaults.deleteFromFavorites(urlString: imageString)
        UserDefaults.deleteNamesFromFavorites(userName: userNameLabelText)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .favoritesChanged, object: nil)
        }
        self.addToFavButton.isHidden = false
        self.deleteFromFavButton.isHidden = true
    }
    
}
