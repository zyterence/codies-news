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
    
    class func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(resource.parse(data))
        }.resume()
    }
    
    class func test() {
        Webservice.load(resource: News.headlines) { news in
            print(news?.articles[0].title ?? "")
        }
    }
}

