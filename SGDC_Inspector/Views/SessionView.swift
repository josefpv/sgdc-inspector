//
//  SessionView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 01-09-23.
//

import SwiftUI

struct SessionView: View {
    
    @State var sessionNumber: String = ""
    @ObservedObject var connectorStatusMV = ConnectorStatusViewModel(connectorStatus: ConnectorStatus.emptyConnectorStatus)
    
    var body: some View {
        VStack {
            Label {
                Text("Session Number")
            } icon: {
                Image(systemName: "number")
                    .foregroundColor(.red)
            }
            TextField("", text: $sessionNumber)
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
                .padding(.horizontal)
                .frame(height: 44)
                .background(Color.white)
                .border(.red)
                .foregroundColor(.black)
                .cornerRadius(10)
                .navigationTitle("Session Status")
            Button("Fetch Status") {
                Task {
                    connectorStatusMV.fetchConnectorStatus(sessionId: Int(sessionNumber) ?? 0)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Divider().background(Color.red)
            
            if connectorStatusMV.connectorStatus.message == "" && connectorStatusMV.connectorStatus.result == "" {
                Text("Type a session ID and press fetch to show data.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            else
            {
                
                List {
                    Section(header: Text("Result")) {
                        HStack {
                            Label {
                                Text("Result")
                            } icon: {
                                Image(systemName: "number")
                                    .foregroundColor(.red)
                            }
                            Spacer()
                            Text("\(connectorStatusMV.connectorStatus.result)")
                        }
                        HStack {
                            Label {
                                Text("Message")
                            } icon: {
                                Image(systemName: "rays")
                                    .foregroundColor(.red)
                            }
                            Spacer()
                            Text("\(connectorStatusMV.connectorStatus.message)")
                        }
                    }
                }
                Spacer()
            }
       
        }
        .padding()
        .onDisappear {
            connectorStatusMV.resetConnectorStatusMode()
        }
    }
        
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}
