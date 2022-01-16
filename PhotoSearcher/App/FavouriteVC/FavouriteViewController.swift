//
//  FavouriteViewController.swift
//  WhiteFluffyTest
//
//  Created by Alex Pupko on 12.01.22.

import UIKit



class FavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource = [FavData().self]
    private var myTableView: UITableView!
    private let myArray: NSArray = ["First","Second","Third"]
    var InfoContr = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    func setupTableView() {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight ))
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = 150
        self.view.addSubview(myTableView)
        myTableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: "MyCustomCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! FavouriteTableViewCell
        
        cell.labelUserName.text = "Author:\(dataSource.first?.nameData?.first) "
        cell.littleImage.image = dataSource.first?.imageData
        print("v name: \(InfoContr.dataSourceFromInfo.first?.nameData)")

        print("v table: \(dataSource.count)")
        return cell
    }
}
