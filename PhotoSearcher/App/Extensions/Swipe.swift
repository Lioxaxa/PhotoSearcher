//
//  Swipe.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 17.01.22.
//

import UIKit


extension FavoriteViewController {
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            
            let alert = UIAlertController(title: "Are you sure you want to delete this photo?",
                                          message: "",
                                          preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Delete", style: .default) { alert in
                
                UserDefaults.deleteFromFavorites(urlString: self.dataSourceImages[indexPath.row])
                
                tableView.reloadData()
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive)  { alert in
                
                tableView.reloadData()
            }
            
            alert.addAction(cancel)
            alert.addAction(ok)
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = #colorLiteral(red: 1, green: 0.01559854578, blue: 0.2870659232, alpha: 1)
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
        
    }

}
