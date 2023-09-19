//
//  PoolResultView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import SwiftUI

struct PoolResultView: View {
    
    @Binding var linea: Linea
    @ObservedObject var poolVM = PoolViewModel(poolId: 0)
    var destination: String
    
    
    var body: some View {
        VStack {
            if poolVM.pool.count > 0 {
                List($poolVM.pool[0].stations, id: \.id) {$station in
                    NavigationLink(destination: StationView(station: $station, destination: destination)) {
                        Label {
                            Text("\(station.name)")
                        } icon: {
                            Image(systemName: "fuelpump.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationTitle("Stations Found")
            }
            else if poolVM.loadingError {
               ErrorServiceView()
            }
            else
            {
                ProgressView().controlSize(.large)
            }
            
        }
        .onAppear(){
            Task {
                poolVM.fetchPoolData(poolId: linea.id)
            }
        }
    }
}

struct PoolResultView_Previews: PreviewProvider {
    static var previews: some View {
        PoolResultView(linea: .constant(Linea.listaLineas[0]), destination: "details")
    }
}
