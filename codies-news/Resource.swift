//
//  Resource.swift
//  codies-news
//
//  Created by Yang Zhang on 2018/1/4.
//  Copyright © 2018年 Yang Zhang. All rights reserved.
//

import Foundation

struct Resource<A> {
    let url: URL
    let parse: (Data) -> A?
}

extension Resource {
    init(url: URL, parseJSON: @escaping (Any) -> A?) {
        self.url = url
        self.parse = { data in
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                return nil
            }
            return parseJSON(json)
        }
    }
}
