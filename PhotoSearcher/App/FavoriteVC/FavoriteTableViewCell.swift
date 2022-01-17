//
//  FavouriteTableViewCell.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 13.01.22.
//

import UIKit
import Kingfisher

final class FavoriteTableViewCell: UITableViewCell {
    
    private var littleImage = UIImageView()
    private var authorLabel = UILabel()
    private var labelUserName = UILabel()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        authorLabel.frame = CGRect(x: contentView.frame.width/2 + 10 ,
                                     y: 5,
                                     width: contentView.frame.width/2,
                                     height: 50)
        authorLabel.text = "Author: "
        
        labelUserName.frame = CGRect(x: contentView.frame.width/2 + 10 ,
                                     y: 40,
                                     width: contentView.frame.width/2,
                                     height: 50)
        labelUserName.numberOfLines = 0
        littleImage.frame = CGRect(x: 5,
                                   y: 5,
                                   width: contentView.frame.width/2 - 20,
                                   height: contentView.frame.width/2 - 20)
        littleImage.clipsToBounds = true
        littleImage.contentMode = .scaleAspectFill
        contentView.addSubview(authorLabel)
        contentView.addSubview(labelUserName)
        contentView.addSubview(littleImage)
    }
    
    func setupWith(urlString: String, userName: String) {
        littleImage.kf.setImage(with: URL(string: urlString))
        labelUserName.text = userName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
        
    }
    
}
