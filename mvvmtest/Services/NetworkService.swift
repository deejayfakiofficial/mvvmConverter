//
//  NetworkService.swift
//  mvvmtest
//
//  Created by Stanislav Terentyev on 13.04.2021.
//
import Foundation

class NetworkService {
    
    static let shared: NetworkService! = NetworkService()
    
    private init () {}
    
    func fetchJSON (completion: @escaping (MainModel)->Void ) {
        guard let url = URL(string: "https://open.exchangerate-api.com/v6/latest") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print (error?.localizedDescription as Any)
                return
            }
            guard let data = data else { return }
            do {
                let results = try JSONDecoder().decode(MainModel.self, from: data)
                completion(results)
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


