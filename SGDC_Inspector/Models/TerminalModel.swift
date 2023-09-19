//
//  PoolsModel.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import Foundation

struct Terminal {
   
    var id: Int
    var name: String
    var lineas: [Linea]
    
    init(id: Int, name: String, lineas: [Linea]) {
        self.id = id
        self.name = name
        self.lineas = lineas
    }
    
}

struct Linea {
    var id: Int
    var numeroLinea: Int
    var label: String
    var terminalId: Int
    
    init(id: Int, numeroLinea: Int, label: String, terminalId: Int) {
        self.id = id
        self.numeroLinea = numeroLinea
        self.label = label
        self.terminalId = terminalId
    }
}

extension Linea {
    static let listaLineas: [Linea] = [
        Linea(id: 82, numeroLinea: 1, label: "", terminalId: 1),
        Linea(id: 83, numeroLinea: 2, label: "", terminalId: 1),
        Linea(id: 180, numeroLinea: 1, label: "", terminalId: 2),
        Linea(id: 181, numeroLinea: 2, label: "", terminalId: 2),
        Linea(id: 182, numeroLinea: 3, label: "", terminalId: 2),
        Linea(id: 183, numeroLinea: 4, label: "", terminalId: 2),
        Linea(id: 184, numeroLinea: 5, label: "", terminalId: 2),
        Linea(id: 185, numeroLinea: 6, label: "", terminalId: 2),
        Linea(id: 11, numeroLinea: 1, label: "", terminalId: 3),
        Linea(id: 12, numeroLinea: 2, label: "", terminalId: 3),
        Linea(id: 13, numeroLinea: 3, label: "", terminalId: 3),
        Linea(id: 15, numeroLinea: 4, label: "", terminalId: 3),
        Linea(id: 16, numeroLinea: 5, label: "", terminalId: 3),
        Linea(id: 17, numeroLinea: 6, label: "", terminalId: 3),
        Linea(id: 18, numeroLinea: 7, label: "", terminalId: 3),
        Linea(id: 19, numeroLinea: 8, label: "", terminalId: 3),
        Linea(id: 20, numeroLinea: 9, label: "", terminalId: 3),
        Linea(id: 79, numeroLinea: 1, label: "", terminalId: 4),
        Linea(id: 80, numeroLinea: 2, label: "", terminalId: 4),
        Linea(id: 81, numeroLinea: 3, label: "", terminalId: 4),
        Linea(id: 67, numeroLinea: 1, label: "", terminalId: 5),
        Linea(id: 68, numeroLinea: 2, label: "", terminalId: 5),
        Linea(id: 69, numeroLinea: 3, label: "", terminalId: 5),
        Linea(id: 70, numeroLinea: 4, label: "", terminalId: 5),
        Linea(id: 71, numeroLinea: 1, label: "", terminalId: 6),
        Linea(id: 72, numeroLinea: 2, label: "", terminalId: 6),
        Linea(id: 73, numeroLinea: 3, label: "", terminalId: 6),
        Linea(id: 66, numeroLinea: 1, label: "", terminalId: 7)
    ]
    
}

extension Terminal {
    static let listaTerminales: [Terminal] = [
        Terminal(id: 1, name: "Camilo Henriquez", lineas: getLineasTerminal(terminalId: 1)),
        Terminal(id: 2, name: "Diagonal Las Torres", lineas: getLineasTerminal(terminalId: 2)),
        Terminal(id: 3, name: "El Conquistador", lineas: getLineasTerminal(terminalId: 3)),
        Terminal(id: 4, name: "La Primavera", lineas: getLineasTerminal(terminalId: 4)),
        Terminal(id: 5, name: "Las Torres", lineas: getLineasTerminal(terminalId: 5)),
        Terminal(id: 6, name: "Los Tilos", lineas: getLineasTerminal(terminalId: 6)),
        Terminal(id: 7, name: "Santa Clara", lineas: getLineasTerminal(terminalId: 7))
        
    ]
}

func getLineasTerminal(terminalId: Int) -> [Linea] {
    return Linea.listaLineas.filter{$0.terminalId == terminalId}
}
