//
//  ConnectorStatusViewModel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 01-09-23.
//

import Foundation

class ConnectorStatusViewModel: ObservableObject {
    
    @Published var loadingError: Bool = false
    @Published var connectorStatus: ConnectorStatus
    
    init(connectorStatus: ConnectorStatus) {
        self.connectorStatus = ConnectorStatus.emptyConnectorStatus
    }
    
    func fetchConnectorStatus(sessionId: Int) {
        
        resetConnectorStatusMode()
        
        let token = ""
        
        let baseUrl = URL(string: "http://pge.dhemax.cl:3100/sessions/\(sessionId)/checkStatus")!
        
        var request = URLRequest(url: baseUrl)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard nil == error else {
                print("Error consultando connector status \(String(describing: error))")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
                
            }
            
            guard let data = data else {
                return
            }
            
            guard let connectorStatusResult = try? JSONDecoder().decode(ConnectorStatus.self, from: data) else
            {
                print("Error decoding response connector status")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            print("Data: \(connectorStatusResult)")
            
            DispatchQueue.main.async {
                self.loadingError = false
                self.connectorStatus = connectorStatusResult
            }
            
            
        }.resume()
        
    }
    
    func resetConnectorStatusMode() {
        DispatchQueue.main.async {
            self.connectorStatus = ConnectorStatus.emptyConnectorStatus
        }
    }
    
}
