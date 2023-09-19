//
//  ActionsBodyModel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 04-09-23.
//

import Foundation

struct ActionHookBody: Encodable {
    var actionType: Int
    var actionValue: Int
    
    init(actionType: Int, actionValue: Int) {
        self.actionType = actionType
        self.actionValue = actionValue
    }
    
}

struct StartChargeBodyModel: Encodable {
        
    var current: Int
    
    init(current: Int) {
        self.current = current
    }
    
}

