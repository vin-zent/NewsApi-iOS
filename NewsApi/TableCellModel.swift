//
//  TableCellModel.swift
//  NewsApi
//
//  Created by Sajin Joseph on 10/12/22.
//

import Foundation

struct TableCellModel{
    let title: String
    let subTitle: String
    let time : String
    let imgUrl: URL?
    var imgData: Data? = nil
    
    init(title: String, subTitle: String, time: String, imgUrl: URL?) {
        self.title = title
        self.subTitle = subTitle
        self.time = time
        self.imgUrl = imgUrl
        
    }
}
