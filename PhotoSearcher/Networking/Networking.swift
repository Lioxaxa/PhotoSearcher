//
//  Networking.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 12.01.22.
//

import UIKit

struct NetworkMethods {

    //MARK: - RandomPhotoLoad
    func loadRandomPhotos(completion: @escaping ([MainModel]) -> Void) {
        let urlRandomString = "https://api.unsplash.com/photos/random?client_id=AiVoqsQQ1FxEr5UmiJItZzwhvakCDkPhJ4qYeiRcJo4&count=10"
        guard let url = URL(string: urlRandomString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult: [MainModel] = try JSONDecoder().decode([MainModel].self, from: data)
                completion(jsonResult)

            
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    //MARK: - SearchPhoto
    
    func searchPhoto(query: String, completion: @escaping (MainModel) -> Void) {
        let urlString = "https://api.unsplash.com/search/photos?page=1&query=\(query)&client_id=AiVoqsQQ1FxEr5UmiJItZzwhvakCDkPhJ4qYeiRcJo4"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(MainModel.self, from: data)
                completion(jsonResult)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }

    
}
