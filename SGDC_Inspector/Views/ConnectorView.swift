//
//  ConnectorView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import SwiftUI

struct ConnectorView: View {
    
    @Binding var connector: Pool.Connector
    @Binding var station: Pool.Station
    var destination: String
    
    var body: some View {
        
        if destination == "details" {
            ConnectorDetailsView(connector: $connector)
        }
        else if destination == "connectorStatus"
        {
            ConnectorStatusView(connector: $connector)
        }
        else {
            ConnectorActionsView(station: $station, connector: $connector)
        }
        
    }
}

struct ConnectorView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectorView(connector: .constant(Pool.Connector.emptyConnector), station: .constant(Pool.Station.sampleStation), destination: "details")
    }
}
