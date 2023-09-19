//
//  ActionResultErrorView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 04-09-23.
//

import SwiftUI

struct ActionResultErrorView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.red)
                .font(.system(size: 50))
                .padding()
            Text("An unexpected error has ocurred, please try again.")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct ActionResultErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ActionResultErrorView()
    }
}
