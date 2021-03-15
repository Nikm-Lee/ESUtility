
import Foundation

/**
 OUT : isReleaseNewVersion -> Bool (T: 업데이트 해야됨, F: 업데이트 안해도됨)
 */
protocol VersionCheck{
    
}
extension VersionCheck{
    var appStoreVersion : String? {
        var version : String?
        guard let bundleId = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String else { return nil }
        let STORE_URL = "http://itunes.apple.com/lookup?bundleId=\(bundleId)&country=kr"
        
        guard let lookUpURL = URL(string: STORE_URL) else { return nil}
        
        do{
            
        let result = try Data(contentsOf: lookUpURL, options: .uncachedRead)
            guard let jsonResult : [String:Any] = try JSONSerialization.jsonObject(with: result) as? Dictionary else { return nil}
            guard let resultCount = jsonResult["resultCount"] as? Int, resultCount > 0 else {return nil}
            guard let appInfoList = jsonResult["results"] as? NSArray else { return nil}
            guard let info = appInfoList.object(at: 0) as? [String:Any] else{ return nil }
            guard let appVersion = info["version"] as? String else {return nil}
            version = appVersion
            
        }catch{
            print("VersionCheck Error => \(error)")
        }
        return version
    }
    
    var currentVersion : String?{
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var isReleaseNewVersion : Bool {
        guard let appStoreVersion = appStoreVersion, let currentVersion = currentVersion else {
            print("Error CurrentVersion : \(self.currentVersion) \n appStoreVersion : \(self.appStoreVersion)");
            return false}
        
        print("################### \n현재 => \(currentVersion)\n앱스토어 => \(appStoreVersion)")
        //스토어버전이 현재
        //아스키코드값으로 비교
        if appStoreVersion.compare(currentVersion) == .orderedDescending{
            print("#현재 최신 버전 아님")
            return true
        }else{
            print("#현재 최신 버전")
            return false
        }
    }
}

