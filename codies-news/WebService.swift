//
//  WebService.swift
//  codies-news
//
//  Created by Yang Zhang on 2018/1/4.
//  Copyright © 2018年 Yang Zhang. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]
var headlines = "https://newsapi.org/v2/top-headlines?sources=hacker-news&apiKey=748d462e15b3483789a0641d462c580e"
var url = URL(string: headlines)!

final class Webservice {

    class func load(url: URL, completion: @escaping (Data) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            completion(data)
        }.resume()
    }
    
    class func test() {
        
        load(url: url) { data in
            let decoder = JSONDecoder()
            let news = try! decoder.decode(News.self, from: data)
            
            print(news.status)
            print(news.articles[0].source.name)
            print(news.articles[0].author ?? "")
        }
    }
}

