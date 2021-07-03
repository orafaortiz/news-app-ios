//
//  Webservices.swift
//  News
//
//  Created by Rafael Ortiz on 01/07/21.
//

import Foundation

class Webservice {

    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder()
                    .decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }    
            } 
        }.resume()
    }
}
