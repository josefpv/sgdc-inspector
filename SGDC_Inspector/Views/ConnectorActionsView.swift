//
//  ConnectorActionsView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 01-09-23.
//

import SwiftUI

struct ConnectorActionsView: View {
    
    @Binding var station: Pool.Station
    @Binding var connector: Pool.Connector
    @ObservedObject var actionsResultVM = ActionsResultViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "fuelpump.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                VStack(alignment: .leading){
                    Text("Number: \(connector.number)")
                        .font(.headline)
                    Text("ID: \(connector.id)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            Divider().background(.red)
            Text("Hook Actions")
            HStack {
                Button {
                    Task {
                        actionsResultVM.moveHook(station: station, connector: connector, action: 1, time: 24)
                    }
                } label: {
                    VStack {
                        Image(systemName: "chevron.up")
                            .bold()
                        Text("UP")
                            .font(.title)
                            .bold()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
                Spacer()
                Button {
                    Task {
                        actionsResultVM.moveHook(station: station, connector: connector, action: 1, time: 24)
                    }
                } label: {
                    VStack {
                        Text("Down")
                            .font(.title)
                            .bold()
                        Image(systemName: "chevron.down")
                            .bold()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(.white)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
            }
            .padding()
            Divider().background(.red)
            Text("Connector Actions")
            HStack {
                Button {
                    Task {
                        actionsResultVM.startCharge(station: station, connector: connector)
                    }
                } label: {
                    VStack {
                        Text("Start Charge")
                            .font(.system(size: 20))
                            .bold()
                        Image(systemName: "play.fill")
                            .bold()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
                Spacer()
                Button {
                    Task {
                        actionsResultVM.stopCharge(station: station, connector: connector)
                    }
                } label: {
                    VStack {
                        Text("Stop Charge")
                            .font(.system(size: 20))
                            .bold()
                        Image(systemName: "stop.fill")
                            .bold()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(.white)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
            }
            .padding()
            Divider().background(.red)
            Group {
                if actionsResultVM.actionResult.message != "" {
                    if actionsResultVM.loadingError {
                        ActionResultErrorView()
                    }
                    else
                    {
                        ActionsResultView(result: $actionsResultVM.actionResult)
                    }
                }
                else
                {
                    VStack{
                        Text("Result will appear here once you push any action.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                
            }
            Spacer()
            .navigationTitle("Actions")
        }
    }
}

struct ConnectorActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectorActionsView(station: .constant(Pool.Station.sampleStation), connector: .constant(Pool.Connector.emptyConnector))
    }
}
