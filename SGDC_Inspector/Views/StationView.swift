//
//  StationView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import SwiftUI

struct StationView: View {
    
    @Binding var station: Pool.Station
    @State private var isShowingDetails = false
    @State private var selectedConnector = Pool.Connector.emptyConnector
    var destination: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "fuelpump.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                VStack(alignment: .leading){
                    Text("Name: \(station.name)")
                        .font(.headline)
                    Text("ID: \(station.id)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            List(station.evses[0].connectors, id:\.id){ evse in
                    Label {
                        Text("Connector - \(evse.id)")
                    } icon: {
                        Image(systemName: "poweroutlet.type.h.fill")
                            .foregroundColor(.red)
                    }
                    .onTapGesture {
                        isShowingDetails = true
                        selectedConnector = evse
                    }
            }
            .sheet(isPresented: $isShowingDetails){
                NavigationStack {
                    ConnectorView(connector: $selectedConnector, station: $station, destination: destination)
                        .navigationTitle("Details")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cerrar") {
                                    isShowingDetails = false
                            }
                        }
                    }
                }
            }
            .navigationTitle("Station Details")
        }
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(station: .constant(Pool.Station.sampleStation), destination: "details")
    }
}
