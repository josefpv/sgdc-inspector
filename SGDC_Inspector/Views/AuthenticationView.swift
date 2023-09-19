//
//  AuthenticationView.swift
//  SGDC_Inspector
//
//  Created by Jose Vivas on 19-09-23.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    
    @State var authenticated : Bool  = false
    @State var canUseBiometrics: Bool = true
    var context = LAContext()
    
    var body: some View {
        VStack {
            
            if canUseBiometrics {
                if authenticated {
                    // show menu
                    MenuView()
                }
                else
                {
                    Button(action: {
                        Task {
                            await authenticate()
                        }
                    }, label: {
                        VStack {
                            Image(systemName: "faceid")
                                .font(.system(size: 100))
                                .foregroundStyle(.blue)
                            Text("Presiona para identificarte")
                        }
                      
                    })
                }
            }
            else
            {
                Image(systemName: "iphone.gen2.slash")
                    .font(.system(size: 100))
                    .foregroundStyle(.red)
                Text("Para usar al APP tu dispositvo debe ser compatible  o tener activado la autenticación biométrica.")
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .onAppear() {
            Task {
                await authenticate()
            }
        }
    }
    
    func authenticate() async {
        
        var error : NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            do {
                try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Autenticate praa ingresar a SGDC Inspector")
                authenticated.toggle()
            }
            catch {
                authenticated = false
            }
            
        }
        else
        {
            canUseBiometrics = false
        }
    }
}

#Preview {
    AuthenticationView()
}
