import Foundation

public class LindenmayerSystem
{
    // properties
    var axiom : String
    var rules : [String : String]
    var word : String
    var reductionFactor : Float
    var direction : Int
    var angle : Int
    var length : Float
    var x : Float
    var y : Float
    var itterations : Int
    
    // initializers
    public init(axiom: String, rules: [String:String], word: String, reductionFactor: Float, angle: Int, length: Float, x: Float, y: Float, direction: Int, itterations: Int)
    {
        self.axiom = axiom
        self.rules = rules
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
            
            for (key, rule) in rules
            {
                if i == Character(key)
                {
                    word.append(rule)
                }
            }
            
            if String(i) == "+" || String(i) == "-"
            {
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
