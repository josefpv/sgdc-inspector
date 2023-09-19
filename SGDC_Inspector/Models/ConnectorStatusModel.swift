//
//  ConnectorStatusModel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 01-09-23.
//

import Foundation


struct ConnectorStatus: Decodable {
    var result: String
    var message: String
}

extension ConnectorStatus {
    static var emptyConnectorStatus: ConnectorStatus {
        ConnectorStatus(result: "", message: "")
    }
}
