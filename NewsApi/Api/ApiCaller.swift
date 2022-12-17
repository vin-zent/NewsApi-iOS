//
//  ApiCaller.swift
//  NewsApi
//
//  Created by Sajin Joseph on 10/12/22.
//

import Foundation


final class ApiCaller{
    
//    static let shared = ApiCaller()
    
    init(){
        
    }
    
    struct contants{
        static let headlineUrl = URL(string: "your Api")
    }
    
    public func getTopSTories(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = contants.headlineUrl else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data,_, error in
            if let error = error{
                completion(.failure(error))
            }else if let data = data{
                do{
                    let result = try JSONDecoder().decode(ApiResponse.self, from: data)
                    
                    print("Arrrrticle : \(result.articles.count)")
                    completion(.success(result.articles))
                }catch{
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
}
