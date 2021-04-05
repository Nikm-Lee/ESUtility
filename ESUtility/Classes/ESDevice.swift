import UIKit
import AdSupport
import CoreTelephony

public protocol ESDevice : NSObject{
    
}
extension ESDevice {
    
    public var device_uuid : String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    public var device_idfa : String {
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        if idfa.contains("000000-0000-0000"){
            return ""
        }
        else{
            return idfa
        }
    }
    
    public var device_size : String{
        return "\(UIScreen.main.bounds.size.width) x \(UIScreen.main.bounds.size.height)"
    }
}
