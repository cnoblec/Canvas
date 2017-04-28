import Foundation

public class EnhancedCanvas : Canvas {
    
    public func render(system s: LindenmayerSystem)
    {
        self.translate(byX: Int(s.x), byY: Int(s.y))

        for i in s.word.characters
        {
            if i == "F"
            {
                line(system: s)
            } else if i == "+"{
                right(system: s)
            } else if i == "-"{
                left(system: s)
            } else if i == "f"{
                skip(system: s)
            }
        }
    }
    
    func right(system s : LindenmayerSystem)
    {
        self.rotate(by: Degrees(s.angle))
    }
    
    func left(system s : LindenmayerSystem)
    {
        self.rotate(by: Degrees(360 - s.angle))
    }
    
    func line(system s : LindenmayerSystem)
    {
        self.drawLine(fromX: 0, fromY: 0, toX: Int(s.length), toY: 0)
        self.translate(byX: Int(s.length), byY: 0)
    }
    
    func skip(system s : LindenmayerSystem)
    {
        self.translate(byX: Int(s.length), byY: 0)
    }
//    func drawIt(string: String)
//    {
//        for i in string.characters
//        {
//            if i == "F"
//            {
//                line(system: s)
//            } else if i == "+"{
//                right()
//            } else if i == "-"{
//                left()
//            } else if i == "f"{
//                skip()
//            }
//        }
//    }

}
