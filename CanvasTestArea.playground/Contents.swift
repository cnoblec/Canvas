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
let canvas = Canvas(width: 350, height: 500)

// View the current state of the canvas
canvas

// Draw the axes
canvas.drawAxes()

canvas.translate(byX: 20, byY: 200)

// Add code below...

let axiom = "F++F++F"

let rule = "F-F++F-F"

var word = ""

let reductionFactor = 3

let angle = 60

var length = 300

func right()
{
    canvas.rotate(by: Degrees(angle))
}

func left()
{
    canvas.rotate(by: Degrees(360 - angle))
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
    word = ""
    for i in string.characters
    {
        if i == "F"
        {
            word.append(rule)
        } else if i == "+"{
            word.append(i)
        } else {
            word.append(i)
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
            right()
        } else if i == "-"{
            left()
        } else if i == "f"{
            skip()
        }
    }
}

func create(withItterations: Int)
{
    
    var counter = 0
    
    word = axiom
    
    while counter < withItterations
    {
        length = length / reductionFactor
        newIt(string: word)
        counter += 1
    }
     drawIt(string: word)
}

//create(withItterations: 4)

LindenmayerSystem.init(axiom: "F++F++F", rule: "F-F++F-F", word: "", reductionFactor: 3, angle: 60, length: 300, x: 0, y: 0, direction: 0, itterations: 1)

print(word)
/*:
 
 ## To see output
 
 To see output, ensure that you have enabled the Assistant Editor...
 
 ![assistant-editor](assistant-editor.png "Enable the Assistant Editor")
 
 ... and verify that you have selected the *Timeline* option:
 
 ![timeline-option](timeline-option.png "Show the timeline")
 
 Finally, do not remove the following line of code:
 
 */
PlaygroundPage.current.liveView = canvas.imageView
