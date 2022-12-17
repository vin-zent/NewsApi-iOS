//
//  ApiModel.swift
//  NewsApi
//
//  Created by Sajin Joseph on 10/12/22.
//

import Foundation


struct ApiResponse: Codable{
    let articles: [Article]
}

struct Article: Codable{
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}


struct Source: Codable{
    let name: String
}
