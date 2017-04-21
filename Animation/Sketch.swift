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
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 300, height: 300)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 1
        
        canvas.translate(byX: 0, byY: 10)
        
    }
    
    let axiom = "F++F++F"
    let rule = "F-F++F-F"
    var printable = ""
    
    var angle = 0
    
    var frame = 0
    
    let baseAngle = 60
    
    var lineCount = 0
    
    var length = 50
    
    var printed = false
    
    func plus()
    {
        angle = baseAngle
        canvas.rotate(by: Degrees(angle))
    }
    
    func minus()
    {
        angle = 360 - baseAngle
        canvas.rotate(by: Degrees(angle))
    }
    
    
    func line()
    {
        canvas.drawLine(fromX: 0, fromY: 0, toX: length, toY: 0)
        canvas.translate(byX: length, byY: 0)
        
    }
    
    func skip()
    {
        canvas.translate(byX: length, byY: 0)
    }
    
    func newIt(string: String)
    {
        printable = ""
        for i in string.characters
        {
            if i == "F"
            {
                printable.append(rule)
                lineCount += 1
            } else if i == "+"{
                printable.append(i)
            } else {
                printable.append(i)
            }
        }
    }
    
    func drawItt(string: String, length: Int)
    {
        var c = 0
        for i in string.characters
        {
            if c < length
            {
                if i == "F"
                {
                    line()
                } else if i == "+"{
                    plus()
                } else if i == "-"{
                    minus()
                } else if i == "f"{
                    skip()
                }
                
                c += 1
            }
        }
    }
    
    func drawOne(char: Character) -> Bool
    {
        if char == "F"
        {
            line()
            return true
        } else if char == "+"{
            plus()
            return false
        } else if char == "-"{
            minus()
            return false
        } else if char == "f"{
            skip()
            return true
        }
        return false
    }
    
    func compile(withItterations: Int)
    {
        
        var counter = 0
        
        printable = axiom
        
        while counter < withItterations
        {
            length = length / 3
            newIt(string: printable)
            counter += 1
        }
        for i in 0...lineCount
        {
            drawItt(string: printable, length: i)
        }
        
        
    }
    
    func createString(withItterations: Int) -> String
    {
        var arrayOfString : [Character] = []
        
        var counter = 0
        
        printable = axiom
        
        while counter < withItterations
        {
            length = length / 3
            newIt(string: printable)
            counter += 1
        }
        
        for i in printable.characters
        {
            arrayOfString.append(i)
        }
        
        return printable
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        // call a function to step through the String by F's
        canvas.translate(byX: 50, byY: 0)
        canvas.drawAxes()
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
