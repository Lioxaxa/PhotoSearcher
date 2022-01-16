//
//  FavouriteTableViewCell.swift
//  WhiteFluffyTest
//
//  Created by Alex Pupko on 13.01.22.
//

import UIKit

final class FavouriteTableViewCell: UITableViewCell {
    
     var littleImage = UIImageView()
     var labelUserName = UILabel()
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         labelUserName.frame = CGRect(x: contentView.frame.width/2 ,
                                      y: 5,
                                      width: contentView.frame.width/2 - 10,
                                      height: 40)
         littleImage.frame = CGRect(x: 5,
                                    y: 5,
                                    width: contentView.frame.width/2 - 20,
                                    height: contentView.frame.width/2 - 20)
         littleImage.contentMode = .scaleAspectFit
         littleImage.image = UIImage.init(systemName: "star")

         contentView.addSubview(labelUserName)
         contentView.addSubview(littleImage)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("tulula")
    }
    
}
