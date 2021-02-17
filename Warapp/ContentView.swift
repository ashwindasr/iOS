//
//  ContentView.swift
//  war-app
//
//  Created by Ashwin Das on 15/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard:String = "card2"
    @State var cpuCard:String = "card3"
    @State var playerScore:Int = 0
    @State var cpuScore:Int = 0
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    let playerCardNumber:Int = Int.random(in: 2...14)
                    let cpuCardNumber:Int = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(playerCardNumber)
                    cpuCard = "card" + String(cpuCardNumber)
                    
                    if playerCardNumber > cpuCardNumber {
                        playerScore += 1
                    } else if (playerCardNumber < cpuCardNumber) {
                        cpuScore += 1
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
