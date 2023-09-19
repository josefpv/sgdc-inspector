//
//  ConnectorDetailsView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 04-09-23.
//

import SwiftUI

struct ConnectorDetailsView: View {
    
    @Binding var connector : Pool.Connector
    
    var body: some View {
        List {
            Section(header: Text("General")) {
                HStack {
                    Label {
                        Text("ID")
                    } icon: {
                        Image(systemName: "number")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(connector.id)")
                }
                HStack {
                    Label {
                        Text("Number")
                    } icon: {
                        Image(systemName: "numbersign")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(connector.number)")
                }
                HStack {
                    Label {
                        Text("Last Updated")
                    } icon: {
                        Image(systemName: "calendar")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(connector.lastUpdated)")
                }
                HStack {
                    Label {
                        Text("Power")
                    } icon: {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(String(format: "%.2f", connector.power))")
                }
                HStack {
                    Label {
                        Text("Energy")
                    } icon: {
                        Image(systemName: "poweroutlet.type.h")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(String(format: "%.2f", connector.energy))")
                }
                HStack {
                    Label {
                        Text("Voltage")
                    } icon: {
                        Image(systemName: "bolt")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(String(format: "%.2f", connector.voltage))")
                }
                HStack {
                    Label {
                        Text("Current")
                    } icon: {
                        Image(systemName: "directcurrent")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(String(format: "%.2f", connector.current))")
                }
                HStack {
                    Label {
                        Text("SOC")
                    } icon: {
                        Image(systemName: "bolt.batteryblock")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(String(format: "%.2f", connector.soc))%")
                }
                HStack {
                    Label {
                        Text("Temperature")
                    } icon: {
                        Image(systemName: "thermometer.medium")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(connector.temperature) °C")
                }
            }
            Section(header: Text("Status - Last Upadate: \(connector.status.lastUpdated)")) {
                HStack {
                    Label {
                        Text("Code")
                    } icon: {
                        Image(systemName: "number")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(connector.status.code)")
                }
                HStack {
                    Label {
                        Text("Status")
                    } icon: {
                        Image(systemName: "rays")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(connector.status.status)")
                }
            }
        }
    }
}

struct ConnectorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectorDetailsView(connector: .constant(Pool.Connector.emptyConnector))
    }
}
