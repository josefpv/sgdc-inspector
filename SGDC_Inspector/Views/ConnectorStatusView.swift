//
//  ConnectorStatusView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 01-09-23.
//

import SwiftUI

struct ConnectorStatusView: View {
    
    @Binding var connector: Pool.Connector
    
    var body: some View {
        VStack {
            switch(connector.status.status) {
            case "Charging":
                Image(systemName: "bolt.circle")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
            case "Available":
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 100))
                    .foregroundColor(.green)
            case "Finishing":
                Image(systemName: "flag.2.crossed.circle")
                    .font(.system(size: 100))
                    .foregroundColor(.green)
            default:
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 100))
                    .foregroundColor(.gray)
            }
            List {
                Section(header: Text("Status Connector")) {
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
}

struct ConnectorStatusView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectorStatusView(connector: .constant(Pool.Connector.emptyConnector))
    }
}
