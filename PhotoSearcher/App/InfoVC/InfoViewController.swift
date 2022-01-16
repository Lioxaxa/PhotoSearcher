//
//  InfoViewController.swift
//  WhiteFluffyTest
//
//  Created by Alex Pupko on 13.01.22.
//

import UIKit

struct FavData {
    var nameData: String?
    var imageData: UIImage?
}

final class InfoViewController: UIViewController, UITableViewDelegate {
    
    var fullSizeImage = UIImageView()
    var image: UIImage?
    var dataSourceFromInfo: [FavData] = []
    
    var userNameLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    var downloadsLabel = UILabel()
    
    var userNameLabelText: String?
    var dateLabelText: String?
    var locationLabelText: String?
    var downloadsLabelText: String?
    
    let addToFavButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.7659371495, green: 0.8488077521, blue: 0.4356547296, alpha: 1)
        button.setTitle("Add to favourite", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.tintColor = UIColor.black
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(addToFavButtonAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFullSizeImage()
        setUI()
    }

    //MARK: - SetUI
    
    func setFullSizeImage() {
        self.view.backgroundColor = .lightGray
        
        fullSizeImage.image = image
        fullSizeImage.clipsToBounds = true
        fullSizeImage.contentMode = .scaleAspectFill
        fullSizeImage.frame = CGRect(x: 5, y: 5,
                                     width: self.view.frame.width - 10,
                                     height: self.view.frame.height/2 - 20)
        view.addSubview(fullSizeImage)
        
    }
    
    func setUI() {
        userNameLabel.frame.size = CGSize(width: 250, height: 30)
        userNameLabel.center = view.center
        userNameLabel.textAlignment = .center
        userNameLabel.text = "Author: " + (userNameLabelText ?? " ")
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

        self.view.addSubview(addToFavButton)
    }
       
    @objc private func addToFavButtonAction() {
            addToFavButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            addToFavButton.setTitle("Delete from favourite", for: .normal)
            print("button fav tapped")
            
            dataSourceFromInfo.append(FavData(nameData: userNameLabelText, imageData: image))
            print("in resource: \(dataSourceFromInfo.count)")
            print(dataSourceFromInfo.first?.nameData!)
        
            
    }

}
