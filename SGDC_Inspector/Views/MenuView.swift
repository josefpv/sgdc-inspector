//
//  MenuView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import SwiftUI

struct MenuView: View {
    
    @State var withConnectorStatus: Bool = true
    @State var withoutConnectorStatus: Bool = false
    @State private var isShowingAbout: Bool = false
    
    var body: some View {
        NavigationStack {
                List {
                    Section(header: Text("Requests & Info")) {
                        NavigationLink(destination: PoolsSelectionView(destination: "details")) {
                            Label {
                                VStack(alignment: .leading) {
                                    Text("Pools")
                                    Text("Check info about all pools")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            } icon: {
                                Image(systemName: "square.fill.and.line.vertical.and.square.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: SessionView()) {
                            Label {
                                VStack(alignment: .leading) {
                                    Text("Session")
                                    Text("Check status of a specific session")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            } icon: {
                                Image(systemName: "battery.100.bolt")
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: PoolsSelectionView(destination: "connectorStatus")) {
                            Label {
                                VStack(alignment: .leading) {
                                    Text("Connector Status")
                                    Text("Get connector status for a connector")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            } icon: {
                                Image(systemName: "poweroutlet.type.e.square")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    Section(header: Text("Actions")) {
                        NavigationLink(destination: PoolsSelectionView(destination: "actions")) {
                            Label {
                                VStack(alignment: .leading) {
                                    Text("Testing actions")
                                    Text("Perform actions for connectors")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            } icon: {
                                Image(systemName: "arrow.up.arrow.down.square")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    Label {
                        VStack(alignment: .leading) {
                            Text("About")
                        }
                    } icon: {
                        Image(systemName: "info.bubble.fill")
                            .foregroundColor(.red)
                    }
                    .onTapGesture {
                        isShowingAbout = true
                    }
                }
                .sheet(isPresented: $isShowingAbout) {
                    NavigationStack {
                        AboutView()
                            .navigationTitle("About App")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cerrar") {
                                        isShowingAbout = false
                                    }
                                }
                            }
                    }
                }
            .navigationTitle("Welcome")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
