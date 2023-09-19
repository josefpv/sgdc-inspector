//
//  ActionsResultModel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 04-09-23.
//

import Foundation

struct ActionsResult: Decodable {
        
    var message: String
    var sessionId: Int?
    
    init(message: String, sessionId: Int? = nil) {
        self.message = message
        self.sessionId = sessionId
    }
    
}

extension ActionsResult {
    
    static var sampleResult: ActionsResult {
        ActionsResult(message: "Correcto", sessionId: 332224)
    }
    
    static var emptyResult: ActionsResult {
        ActionsResult(message: "")
    }
    
}
