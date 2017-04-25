//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare constants
    let north = 0
    let northEast = 1
    let east = 2
    let southEast = 3
    let south = 4
    let southWest = 5
    let west = 6
    let northWest = 7
    
    // Set the step size (travel distance per iteration)
    let stepSize = 5
    
    // Set the pixel size
    let diameter = 7
    
    // Generate a starting position
    var x = 0
    var y = 0
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 300)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 1
        
        // Translate up to middle of canvas
        canvas.translate(byX: 0, byY: canvas.height / 2)
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Tranlate to the right a bit each time
        canvas.translate(byX: 25, byY: 0)
        
        // Draw the axes
        canvas.drawAxes()
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }

}
