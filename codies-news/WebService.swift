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
    
    class func load<A:Codable>(url: URL, completion: @escaping (A?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            let result = try! decoder.decode(A.self, from: data)
            completion(result)
            }.resume()
    }
    
    class func loadNews(completion: @escaping (News?) -> ()) {
        load(url: url) { news in
            completion(news)
        }
    }
    
    class func test() {
        loadNews { news in
            print(news?.status ?? "")
            print(news?.articles[0].source.name ?? "")
            print(news?.articles[0].author ?? "")
        }
    }
}

