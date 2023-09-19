//
//  TerminalesView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import SwiftUI

struct PoolsSelectionView: View {
    
    @State var terminales: [Terminal] = Terminal.listaTerminales
    var destination: String
    
    var body: some View {
        VStack{
            List($terminales, id:\.id){
                $terminal in
                Section(header: Text(terminal.name)) {
                    ForEach($terminal.lineas, id: \.id) {$linea in
                        NavigationLink(destination: PoolResultView(linea: $linea, destination: destination )) {
                            Label {
                                Text("Pool \(linea.id) - L\(linea.numeroLinea)")
                            } icon: {
                                Image(systemName: "cable.connector.horizontal")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Pools")
    }
}

struct PoolsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PoolsSelectionView(destination: "details")
    }
}
