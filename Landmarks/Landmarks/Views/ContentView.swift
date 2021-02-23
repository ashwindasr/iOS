//
//  ContentView.swift
//  Landmarks
//
//  Created by Ashwin Das on 22/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
