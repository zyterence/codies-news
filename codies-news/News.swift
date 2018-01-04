//
//  News.swift
//  codies-news
//
//  Created by Yang Zhang on 2018/1/4.
//  Copyright © 2018年 Yang Zhang. All rights reserved.
//

import Foundation

struct Source {
    let id: String?
    let name: String?
}

struct Article {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

extension Article {
    init?(dictionary: JSONDictionary) {
        let id = dictionary["id"] as? String
        let name = dictionary["name"] as? String
        source = Source(id: id, name: name)
        author = dictionary["author"] as? String
        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        url = dictionary["url"] as? String
        urlToImage = dictionary["urlToImage"] as? String
        publishedAt = dictionary["publishedAt"] as? String
    }
}

struct News {
    let status: String
    let totalResults: Int
    let articles: Array<Article>
}

extension News {
    init?(dictionary: JSONDictionary) {
        guard let status = dictionary["status"] as? String,
            let totalResults = dictionary["totalResults"] as? Int,
            let articles = dictionary["articles"] as? [JSONDictionary]
            else { return nil }
        self.status = status
        self.totalResults = totalResults
        self.articles = articles.flatMap({ (dictionary) -> Article? in
            return Article(dictionary: dictionary)
        })
    }
}

extension News {
    static let headlines = Resource<News>(url: url, parseJSON: { json in
        guard let dictionary = json as? JSONDictionary else { return nil }
        return News(dictionary: dictionary)
    })
}
