/*:
 
 # Canvas
 
 The Canvas class provides methods that allow basic shapes to be drawn on a Cartesian plane.
 
 - callout(Experiment):
 
 Uncomment line 27 so that the axes of the plane are automatically drawn.
 
 Where is the origin?
 
 In what direction do values on the *x* and *y* axes increase?
 
 */
// These are some required statements to make this playground work.
import Cocoa
import PlaygroundSupport

// Create a new canvas
let canvas = Canvas(width: 300, height: 300)

// View the current state of the canvas
canvas

// Draw the axes
canvas.drawAxes()

canvas.translate(byX: 100, byY: 100)

// Add code below...

let axiom = "F"
let rule = "F-F++F"
var printable = ""

var angle = 0

let baseAngle = 45

var length = 7

func plus(number: Int)
{
    angle = baseAngle * number
    canvas.rotate(by: Degrees(angle))
}

func minus(number: Int)
{
    angle = 360 - (baseAngle * number)
    canvas.rotate(by: Degrees(angle))
}

func line()
{
    canvas.drawLine(fromX: 0, fromY: length, toX: 0, toY: 0)
    canvas.translate(byX: 0, byY: length)
    
}

func skip()
{
    canvas.translate(byX: 0, byY: length)
}

func newIt(string: String)
{
    printable = ""
    for i in string.characters
    {
        if i == "F"
        {
            printable.append(rule)
        } else if i == "+"{
            printable.append(i)
        } else {
            printable.append(i)
        }
    }
}

func drawIt(string: String)
{
    for i in string.characters
    {
        if i == "F"
        {
            line()
        } else if i == "+"{
            plus(number: 1)
        } else if i == "-"{
            minus(number: 1)
        } else if i == "f"{
            minus(number: 1)
        }
    }
}

func draw(withItterations: Int)
{
    
    var counter = 0
    
    let lengthScale = 1
    
    printable = axiom
    
    while counter < withItterations
    {
        length = length / lengthScale
        newIt(string: printable)
        counter += 1
    }
    
    drawIt(string: printable)
}

draw(withItterations: 7)

canvas.saveState()
printable
/*:
 
 ## To see output
 
 To see output, ensure that you have enabled the Assistant Editor...
 
 ![assistant-editor](assistant-editor.png "Enable the Assistant Editor")
 
 ... and verify that you have selected the *Timeline* option:
 
 ![timeline-option](timeline-option.png "Show the timeline")
 
 Finally, do not remove the following line of code:
 
 */
PlaygroundPage.current.liveView = canvas.imageView
