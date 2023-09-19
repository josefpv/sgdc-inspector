//
//  ErrorServiceView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 01-09-23.
//

import SwiftUI

struct ErrorServiceView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud")
                .font(.system(size: 60))
                .foregroundColor(.red)
            Text("Servicio no disponible, intente nuevamente")
                .font(.caption)
        }
    }
}

struct ErrorServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorServiceView()
    }
}
