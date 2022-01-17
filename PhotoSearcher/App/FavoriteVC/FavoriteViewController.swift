//
//  FavouriteViewController.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 12.01.22.

import UIKit

final class FavoriteViewController: UIViewController {
     
    var dataSourceImages: [String] {
        return UserDefaults.getFavoritesImages()
    }
    var dataSourceNames: [String] {
       return UserDefaults.getFavoritesNames()
   }
    
    private var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()
    
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadTableData),
                                               name: .favoritesChanged,
                                               object: nil)
    }
    
   private func setupTableView() {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight ))
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = 150
        myTableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "MyCustomCell")
        self.view.addSubview(myTableView)

    }
    
    @objc private func reloadTableData() {
        myTableView.reloadData()
    }
}


//MARK: - UITableViewDataSource, UITableViewDelegate
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let controller = InfoViewController(imageUrlString: dataSourceImages[indexPath.row],
                                            userName: dataSourceNames[indexPath.row]) 
        present(controller, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! FavoriteTableViewCell
       
        cell.setupWith(urlString: dataSourceImages[indexPath.row],
                       userName: dataSourceNames[indexPath.row])
        return cell
    }
}
//hello
