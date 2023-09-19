//
//  PoolViewMdel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import Foundation

class PoolViewModel: ObservableObject {
        
    @Published var poolId: Int
    @Published var pool = [Pool]()
    @Published var loadingError: Bool = false
    
    init(poolId: Int, pool: [Pool] = [Pool]()) {
        self.poolId = poolId
        self.pool = pool
    }
        
    func fetchPoolData(poolId: Int) {
        
        let token = ""
        
        let baseUrl = URL(string: "http://pge.dhemax.cl:3100/pools/\(poolId)")!
        var request = URLRequest(url: baseUrl)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        print("Base URL: \(request)")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard nil == error else {
                print("Error \(String(describing: error))")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            guard let data = data else {
                return
            }
            
            guard let poolResult = try? JSONDecoder().decode([Pool].self, from: data) else {
                print("Ocurrio un error")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            DispatchQueue.main.async {
                self.loadingError = false
                self.pool = poolResult
            }
            
        }
        .resume()
        
    }
    
}
