//
//  ActionsResultView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 04-09-23.
//

import SwiftUI

struct ActionsResultView: View {
    
    @Binding var result: ActionsResult
    
    var body: some View {
        VStack {
            Text("Response")
            List {
                HStack {
                    Label {
                        Text("Message")
                    } icon: {
                        Image(systemName: "info.bubble.fill")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text(result.message)
                }
                if let unwrapSessionId = result.sessionId {
                    HStack {
                        Label {
                            Text("Session ID")
                        } icon: {
                            Image(systemName: "info.bubble.fill")
                                .foregroundColor(.red)
                        }
                        Spacer()
                        Text("\(unwrapSessionId)")
                    }
                }

            }
        }
    }
}

struct ActionsResultView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsResultView(result: .constant(ActionsResult.emptyResult))
    }
}
