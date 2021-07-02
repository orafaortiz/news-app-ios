//
//  Article.swift
//  News
//
//  Created by Rafael Ortiz on 01/07/21.
//

import Foundation

struct ArticleList: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]?
}

struct Article: Decodable {
    let author: String?
    let title: String
    let description: String
    let url: URL?
    let urlToImage: URL?
    let content: String
}
