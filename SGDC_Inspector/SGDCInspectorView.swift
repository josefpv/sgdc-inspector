//
//  ContentView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 31-08-23.
//

import SwiftUI

struct SGDCInspectorView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SGDCInspectorView()
    }
}
