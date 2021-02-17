  //
//  ContentView.swift
//  test
//
//  Created by Ashwin Das on 12/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            ZStack {
                VStack {
                    Image("toronto")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10.0)
                }
                
                
                VStack {
                    Text("CN Tower")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        
                    
                    Text("Toronto")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                        
                }.padding([.top, .leading, .trailing])
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom)
            
            ZStack {
                VStack {
                    Image("london")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10.0)
                }
                .padding(.bottom)
                
                
                VStack {
                    Text("Big Ben")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        
                    
                    Text("London")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                        
                }.padding([.top, .leading, .trailing])
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
