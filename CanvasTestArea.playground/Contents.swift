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
let canvas = Canvas(width: 300, height: 500)

// View the current state of the canvas
canvas

// Draw the axes
canvas.drawAxes()

canvas.translate(byX: 0, byY: 200)

// Add code below...

let axiom = "F++F++F"
let rule = "F-F++F-F"
var printable = ""

var angle = 0

var length = 300

func plus(number: Int)
{
    angle = 60 * number
    canvas.rotate(by: Degrees(angle))
}

func minus(number: Int)
{
    angle = 360 - (60 * number)
    canvas.rotate(by: Degrees(angle))
}


func line()
{
    canvas.drawLine(fromX: 0, fromY: 0, toX: length, toY: 0)
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
        } else {
            minus(number: 1)
        }
    }
}

func draw(withItterations: Int)
{
    
    var counter = 0
    
    printable = axiom
    
    while counter < withItterations
    {
        length = length / 3
        newIt(string: printable)
        counter += 1
    }
    
    drawIt(string: printable)
}

draw(withItterations: 1)

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
