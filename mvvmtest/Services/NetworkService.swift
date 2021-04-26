//
//  NetworkService.swift
//  mvvmtest
//
//  Created by Stanislav Terentyev on 13.04.2021.
//
import Foundation
import Alamofire

class NetworkService {
    
    static let shared: NetworkService! = NetworkService()
    
    private init () {}
    
    let url = "https://open.exchangerate-api.com/v6/latest"
    
    func fetchJSON (completion: @escaping (MainModel) -> Void) {
        AF.request(url).response { responseData in
            guard let data = responseData.data else { return }
            do {
                let results = try JSONDecoder().decode(MainModel.self, from: data)
                completion(results)
            }
            catch {
               print("Error")
            }
            
        }
    }
}


