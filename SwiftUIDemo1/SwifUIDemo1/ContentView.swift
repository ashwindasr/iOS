//
//  ContentView.swift
//  SwiftUIDemo1
//
//  Created by Ashwin Das on 21/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Map
            MapView()
                .frame(height: 300)
                .ignoresSafeArea()
            
            // Image
            CircleView()
                .offset(y: -180)
                .padding(.bottom, -170)
            
            // Texts
            VStack(alignment: .leading) {
                // The title text
                Text("Mt. Fuji")
                    .font(.title)
                
                // HStack for the two smaller texts
                HStack {
                    Text("Honshu Island")
                        .font(.subheadline)
                    
                    // Spacer to push the elements to the sides
                    Spacer()
                    Text("Japan")
                        .font(.subheadline)
                }
            }.padding()
            
            Spacer()
        } // Padding for VStack for space between the VStack edge and the phone screen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
