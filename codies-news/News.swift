//
//  News.swift
//  codies-news
//
//  Created by Yang Zhang on 2018/1/4.
//  Copyright © 2018年 Yang Zhang. All rights reserved.
//

import Foundation

struct News: Codable {

    struct Article: Codable {

        struct Source: Codable {
            
            let id: String
            let name: String
            
            init(id: String, name:String) {
                self.id = id
                self.name = name
            }
        }
        
        let source: Source
        let author: String?
        let title: String
        let description: String?
        let url: String
        let urlToImage: String?
        let publishedAt: String?
        
        init(source: Source, author: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String) {
            self.source = source
            self.author = author
            self.title = title
            self.description = description
            self.url = url
            self.urlToImage = urlToImage
            self.publishedAt = publishedAt
        }
    }
    
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}
