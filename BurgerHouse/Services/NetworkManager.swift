//
//  NetworkManager.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 21.04.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let urlAdress = "https://burgers1.p.rapidapi.com/burgers"
    
    func getBurgers(completion: @escaping (_ burgers: [Burger]) -> Void) {
        guard let url = URL(string: urlAdress) else { return }
        
        let headers = [
            "X-RapidAPI-Host": "burgers1.p.rapidapi.com",
            "X-RapidAPI-Key": "513499b3cfmshc7aca0fd4e9db26p14feffjsn3073bc7d5e05"
        ]
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 15.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, _, error) -> Void in
            
            guard let data = data else { return }
            
            do {
                let data = try JSONDecoder().decode([Burger].self, from: data)
                DispatchQueue.main.async {
                    
                    completion(data)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }).resume()
    }
}
