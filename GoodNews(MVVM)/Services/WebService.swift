//
//  WebService.swift
//  GoodNews(MVVM)
//
//  Created by mohamed elgharpawi on 05/03/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class Webservice {
    
    class  func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        AF.request(url, method: .get)
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        var articleArr = [Article]()
                        do{
                            
                            let json = try JSON(data: data)
                            for article in json["articles"].arrayValue{
                                
                                articleArr.append(Article(title: article["title"].stringValue, articleDescription: article["description"].stringValue))
                            }
                            completion(articleArr)
                            
                            
                        }
                        catch{
                            
                        }
                    }
                    
                case .failure(let error):
                    print(error)
                    
                    completion([])
                }
            }
        
        
    }
    
}
