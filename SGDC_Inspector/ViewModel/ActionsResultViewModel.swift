//
//  ActionsResultViewModel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 04-09-23.
//

import Foundation

class ActionsResultViewModel: ObservableObject {
    
    @Published var loadingError: Bool = false
    @Published var actionResult: ActionsResult
    
    init(actionsResult: ActionsResult = ActionsResult.emptyResult) {
        self.actionResult = actionsResult
    }
    
    func moveHook(station: Pool.Station, connector: Pool.Connector, action: Int, time: Int) {
        
        let baseUrl = URL(string: "http://pge.dhemax.cl:3100/stations/\(station.id)/connectors/\(connector.id)/moveHoist")!
        
        let token = ""
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        
        let body = ActionHookBody(actionType: action, actionValue: time)
        let encoder = JSONEncoder()
        
        request.httpBody = try? encoder.encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard nil == error else {
                print("Error while trying moving hook: \(String(describing: error))")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                
                return
            }
            
            guard let data = data else {
                return
            }
            
            guard let actionResult = try? JSONDecoder().decode(ActionsResult.self, from: data) else {
                print("Error while trying decoding data from action")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            print("Response action: \(actionResult)")
            
            DispatchQueue.main.async {
                self.loadingError = false
                self.actionResult = actionResult
            }
            
        }.resume()
    }
    
    func startCharge(station: Pool.Station, connector: Pool.Connector) {
        print("starting charge")
        
        let baseUrl = URL(string: "http://pge.dhemax.cl:3100/stations/\(station.id)/connectors/\(connector.id)/startSession")!
        
        let token = ""
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        let body = StartChargeBodyModel(current: 200)
        let encoder = JSONEncoder()
        
        request.httpBody = try? encoder.encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard nil == error else
            {
                print("Error while trying start charge: \(String(describing: error))")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            guard let data = data else {
                return
            }
            
            guard let actionResult = try? JSONDecoder().decode(ActionsResult.self, from: data) else {
                print("Error while trying decoding data starting charge")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            DispatchQueue.main.async {
                self.loadingError = false
                self.actionResult = actionResult
            }
            
            
        }.resume()
    }
    
    func stopCharge(station: Pool.Station, connector: Pool.Connector) {
        print("Stop charging")
        
        let baseUrl = URL(string: "http://pge.dhemax.cl:3100/stations/\(station.id)/connectors/\(connector.id)/stopSession")!
        
        let token = ""
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard nil == error else
            {
                print("Error while trying stop charge: \(String(describing: error))")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            guard let data = data else {
                return
            }
            
            guard let actionResult = try? JSONDecoder().decode(ActionsResult.self, from: data) else {
                print("Error while trying decoding data stopping charge")
                DispatchQueue.main.async {
                    self.loadingError = true
                }
                return
            }
            
            DispatchQueue.main.async {
                self.loadingError = false
                self.actionResult = actionResult
            }
            
            
        }.resume()
    }
    
}
