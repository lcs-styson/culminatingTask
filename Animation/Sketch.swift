import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Tortoise to draw with
    let turtle : Tortoise
    
    // Sketch's current pen color
    var color : Color = Color.black

    // Sketch's current pen size
    var size : Int = 1

    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Create turtle to draw with
        turtle = Tortoise(drawingUpon: canvas)
        
        // Move to middle of screen
        turtle.penUp()
        turtle.setPosition(to: Point(x: 250, y: 250))
        turtle.penDown()
        
        // Make the drawing animate more slowly
        canvas.framesPerSecond = 5

    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Required to bring canvas into same orientation and origin position as last run of draw() function
        turtle.restoreStateOnCanvas()

        // Set the turtle's pen color to the sketch color
        turtle.setPenColor(to: self.color)
        
        // Set the turtles pen size to the sketch size
        print("Size of pen is: \(self.size)")
        turtle.setPenSize(to: self.size)

        // Move the turtle forward and turn it a bit
        turtle.forward(steps: 5)
        turtle.right(by: 1)
//        turtle.setHeading(to: Degrees(x))
        
    }
    
}
