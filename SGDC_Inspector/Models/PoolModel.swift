//
//  StationModel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import Foundation

struct Pool: Decodable {
    
    var id: Int
    var name: String
    var stations: [Station]
    
    init(id: Int, name: String, stations: [Station]) {
        self.id = id
        self.name = name
        self.stations = stations
    }
    
    struct Station: Decodable{
        var id: Int
        var name: String
        var evses: [Evses]
        var alert: AlertStation
    }
    
    struct AlertStation: Decodable {
        var code: String
        var status: String
        var lastUpdated: String
        
        init(code: String, status: String, lastUpdated: String) {
            self.code = code
            self.status = status
            self.lastUpdated = lastUpdated
        }
    }
    
    struct Evses: Decodable {
        var connectors: [Connector]
        
        init(connectors: [Connector]) {
            self.connectors = connectors
        }
    }
    
    struct Connector: Decodable {
        
       var id: Int
       var number: Int
       var lastUpdated: String
       var power: Double
       var energy: Double
       var voltage: Double
       var current: Double
       var soc: Double
       var temperature: Double
       var status: StatusConnector
        
        init(id: Int, number: Int, lastUpdated: String, power: Double, energy: Double, voltage: Double, current: Double, soc: Double, temperature: Double, status: StatusConnector) {
            self.id = id
            self.number = number
            self.lastUpdated = lastUpdated
            self.power = power
            self.energy = energy
            self.voltage = voltage
            self.current = current
            self.soc = soc
            self.temperature = temperature
            self.status = status
        }
        
        static var emptyConnector: Connector {
            Connector(id: 0, number: 0, lastUpdated: "", power: 0.0, energy: 0.0, voltage: 0.0, current: 0.0, soc: 0.0, temperature: 0.0, status: Pool.StatusConnector(code: "", status: "", lastUpdated: ""))
        }
    }

    struct StatusConnector: Decodable {
        var code: String
        var status: String
        var lastUpdated: String
        
        init(code: String, status: String, lastUpdated: String) {
            self.code = code
            self.status = status
            self.lastUpdated = lastUpdated
        }
    }
    
}



extension Pool.Station {
    static var sampleStation: Pool.Station {
        Pool.Station(id: 3, name: "Test station", evses: [Pool.Evses(connectors: [Pool.Connector(id: 1, number: 1, lastUpdated: "31-08-2023", power: 20.0, energy: 44.4, voltage: 56.7, current: 43.2, soc: 44, temperature: 69.4, status: Pool.StatusConnector(code: "NoError", status: "Available", lastUpdated: "31-08-2023")), Pool.Connector(id: 2, number: 1, lastUpdated: "31-08-2023", power: 20.0, energy: 44.4, voltage: 56.7, current: 43.2, soc: 44, temperature: 69.4, status: Pool.StatusConnector(code: "NoError", status: "Available", lastUpdated: "31-08-2023"))])], alert: Pool.AlertStation(code: "NoError", status: "Charging", lastUpdated: "31-08-2023"))
    }
}
