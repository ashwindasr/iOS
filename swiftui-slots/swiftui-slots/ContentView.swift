//
//  ContentView.swift
//  swiftui-slots
//
//  Created by Ashwin Das on 16/02/21.
//

import SwiftUI

struct ContentView: View {
    
    // Structure variables
    private let images:[String] = ["apple", "cherry", "star"]
    
    // For initial display, generating 3x3 image grid
    @State private var displayImages:[[String]] = Array(repeating: Array(repeating: "apple", count: 3), count: 3)
    
    @State private var credits:Int = 100
    
    // Setting intitial backgrounf values for 3x3 image grid
    @State private var successColor:[[Color]] = Array(repeating: Array(repeating: Color.white, count: 3), count: 3)
    
    // Structure functions
    func chooseRandomImages() -> [[String]] {
        var grid:[[String]] = []
        
        for _ in 0...2 {
            
            var temp:[String] = []
            for _ in 0...2 {
                temp.append(images.randomElement()!)
            }
            
            grid.append(temp)
        }
        
        return grid
    }
    
    // Functions for checking rows columns and diagonals
    func checkRows() -> Bool {
        
        // Set success colors to row1
        if Set(displayImages[0]).count == 1 {
            successColor[0] = [Color.green, Color.green, Color.green]
        } else if Set(displayImages[1]).count == 1 {
            successColor[1] = [Color.green, Color.green, Color.green]
        } else if Set(displayImages[2]).count == 1 {
            successColor[2] = [Color.green, Color.green, Color.green]
        } else {
            return false
        }
        
        // Only returned if there is a matching row
        return true
    }
    
    func checkImages(_ coordinates1:[Int], _ coordinates2:[Int], _ coordinates3:[Int]) -> Bool {
        if Set([displayImages[coordinates1[0]][coordinates1[0]],
                displayImages[coordinates2[0]][coordinates2[0]],
                displayImages[coordinates3[0]][coordinates3[0]]]).count == 1 {
            
            successColor[coordinates1[0]][coordinates1[0]] = Color.green
            successColor[coordinates2[0]][coordinates2[0]] = Color.green
            successColor[coordinates3[0]][coordinates3[0]] = Color.green
            
            return true
        }
        
        return false
    }
    
    func checkColumns() -> Bool {
        
        // Check and set colors if there are any column matches
        let flag1:Bool = checkImages([0, 0], [1, 0], [2, 0])
        let flag2:Bool = checkImages([0, 1], [1, 1], [2, 1])
        let flag3:Bool = checkImages([0, 2], [1, 2], [2, 2])
        
        if flag1 || flag2 || flag3 {
            // only returned if there is a matching column
            return true
        }
        
        // only returned if there are no matching columns
        return false
    }
    
    func checkLeadingDiagonal() -> Bool {
        
        // Check and set colors if there are any leading diagonal matches
        if checkImages([0, 0], [1, 1], [2, 2]) {
            // only returned if there is a matching leading diagonal
            return true
        }
        return false
    }
    
    func checkTrailingDiagonal() -> Bool {

        // Check and set colors if there are any trailing diagonal matches
        if checkImages([0, 2], [1, 1], [2, 0]) {
            // only returned if there is a matching leading diagonal
            return true
        }
        return false
    }
     
    var body: some View {
        
        
        ZStack {
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(Color(red: 228/225, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .ignoresSafeArea()
            
            // Content
            VStack {
                Spacer()
                HStack {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots!")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                }.scaleEffect(2, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                Text("Credits: " + String(credits))
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 10.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/.opacity(0.5))
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                VStack {
                    
                    // Image row 1
                    RowView(row: $displayImages[0], colorArray: $successColor[0])
                    
                    // Image row 2
                    RowView(row: $displayImages[1], colorArray: $successColor[1])
                    
                    // Image row 2
                    RowView(row: $displayImages[2], colorArray: $successColor[2])
                }
                
                Spacer()
                
                Button(action: {
                    
                    // Set random images to 3x3 image grid
                    // Set random row 1 images
                    displayImages = chooseRandomImages()
                    
                    
                    // Set all background colors to white
                    successColor =
                        [[Color.white, Color.white, Color.white],
                         [Color.white, Color.white, Color.white],
                         [Color.white, Color.white, Color.white]]
                    
                    
                    // Get the total number of matches in the grid
                    let totalMatches = [checkRows(), checkColumns(), checkLeadingDiagonal(), checkTrailingDiagonal()].filter{
                        $0 == true
                    }.count
                    
                    
                    // For full grid check
                    if totalMatches == 4 {
                        credits += 100
                    }
                    
                    
                    // If there are one or more matches give the appropriate score for each match, else deduct points
                    if totalMatches != 0 {
                        
                        // Multiply the count by the point of each match
                        credits += (totalMatches * 10)
                        
                    } else {
                        credits -= 5
                    }
                    
                }) {
                    Text("Spin")
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 40.0)
                        .padding(.vertical, 10.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20.0)
                }

                Spacer()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12")
        }
    }
}
