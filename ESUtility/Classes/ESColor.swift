
/**
extension UIColor Init :
 1. by( red, green, blue, alpha)
 2. red, green, blue Init
 3. hexCode : Int ( 0xDF08A2 ) 16진수
 */

import UIKit

extension UIColor{
    
    public static func by(r:Int, g:Int, b:Int, a:CGFloat = 1) -> UIColor{
        let d = CGFloat(255)
        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
    }
    
    public convenience init(red : Int, green : Int, blue : Int){
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    public convenience init(hexCode : Int){
        self.init(
            red: (hexCode >> 16) & 0xFF,
            green : (hexCode >> 8) & 0xFF,
            blue : hexCode & 0xFF
        )
    }
}

