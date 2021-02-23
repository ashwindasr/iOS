//
//  Landmark.swift
//  Landmarks
//
//  Created by Ashwin Das on 22/02/21.
//

import Foundation
import SwiftUI
import CoreLocation

// Codable protocol used to process JSON files
// Identifiable protocol used in order to use Landmark with Lists
struct Landmark: Hashable, Codable, Identifiable {
    // Fields corresponding to the data in the JSON file
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String   // Name of image from the JSON file
    var image: Image {
        Image(imageName)    // Get the image from assets
    }
    
    // Create new struct to conform to coordinates data in the JSON file
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
