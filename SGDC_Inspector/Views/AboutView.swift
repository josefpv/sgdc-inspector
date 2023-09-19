//
//  AboutView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 04-09-23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack{
                Image(systemName: "info.bubble.fill")
                    .font(.system(size: 70))
                    .foregroundColor(.red)
                Text("SGDC Inspector")
                    .font(.title)
                    .bold()
                    .foregroundColor(.red)
                Text("2023 v1.0")
                    .foregroundColor(.gray)
            }
            .padding()
            VStack {
                Text("Developed & designed by Jose F. Peñaloza V.")
                    .padding(.bottom)
                Text("This app is used for fetching and monitoring status of stations and connectors used by STP Santiago and check comunication between Dhemax API and SGDC website.")
            }
            .padding()
            Spacer()
            VStack {
                Text("This app must be used only under authorization.")
                    .bold()
                    .foregroundColor(.red)
                Text("For more information about developer, email to: josefvivas@icloud.com")
                    .font(.caption)
            }
            .padding()
        }
        .multilineTextAlignment(.center)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
