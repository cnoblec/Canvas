import Foundation

public class LindenmayerSystem
{
    // properties
    var axiom : String
    var rule : String
    var word : String
    var reductionFactor : Int
    var direction : Int
    var angle : Int
    var length : Int
    var x : Int
    var y : Int
    var itterations : Int
    
    // initializers
    public init(axiom: String, rule: String, word: String, reductionFactor: Int, angle: Int, length: Int, x: Int, y: Int, direction: Int, itterations: Int)
    {
        self.axiom = axiom
        self.rule = rule
        self.word = word
        self.reductionFactor = reductionFactor
        self.angle = angle
        self.length = length
        self.x = x
        self.y = y
        self.direction = direction
        self.itterations = itterations
        
        create(withItterations: itterations) // calling the function to rewrite the word
    }
    // behaviors
    
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
    }
}
