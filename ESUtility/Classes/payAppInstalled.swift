//
//  payAppInstalled.swift
//  MesseEsang
//
//  Created by esmnc1 on 2021/03/11.
//  Copyright © 2021 MesseEsang. All rights reserved.
//

/**
 IN : _ payApps => url Schem include '://'
    ex) kb-acp://
    ex) mpocket.online.ansimclick://
 
 OUT : nil 바로 앱스토어가 열림
 */

import UIKit

enum payApp : String{
    case shinhanCard = "shinhan-sr-ansimclick" //신한카드앱
    case hyundaieCard = "hdcardappcardansimclick" //현대카드앱
    case kbCard = "kb-acp" //국민카드앱
    case allonepay = "nhallonepayansimclick" //올원페이(농협)
    case samsungCard = "mpocket.online.ansimclick" //삼성카드앱
    case lotteCard = "lotteappcard" //롯데카드앱
    case citiCard = "citimobileapp" // 씨티카드앱
    case lpay = "lpayapp" //엘페이앱
    case hanaCard = "cloudpay" // 하나카드앱
    case paybook = "ispmobile" //페이북앱
    case payco = "payco" // 페이코앱
    case kpay = "kpay" //Kpay앱
    case hanamembers = "hanawalletmembers" // 하나멤버스 앱
    
}

protocol payAppInstalled{
    
}

extension payAppInstalled{
    func Installed(_ payApps : String){
        let goAppStore = payApps.components(separatedBy: "://")[0]
        var url : URL? = URL(string: "")
        
        guard let goAppStores : payApp = payApp(rawValue: goAppStore) else {return}
        switch goAppStores{
        case .shinhanCard:
            url = URL(string: "https://itunes.apple.com/kr/app/sinhan-mobilegyeolje/id572462317?mt=8")//신한카드앱
        case .hyundaieCard:
            url = URL(string: "http://itunes.apple.com/kr/app/id702653088?mt=8") //현대카드앱
        case .kbCard:
            url = URL(string: "https://itunes.apple.com/kr/app/kbgugmin-aebkadue/id695436326?mt=8") //국민카드앱
        case .allonepay:
            url = URL(string: "https://itunes.apple.com/kr/app/id1177889176?mt=8") //올원페이
        case .samsungCard:
            url = URL(string: "https://itunes.apple.com/kr/app/mpokes/id535125356?mt=8&ls=1") //삼성카드앱
        case .lotteCard:
            url = URL(string: "https://itunes.apple.com/kr/app/losde-aebkadeu/id688047200?mt=8") //롯데카드앱
        case .citiCard:
            url = URL(string : "https://apps.apple.com/kr/app/citibank-kr/id1179759666?l=en&mt=8") //씨티카드 앱
        case .lpay:
            url = URL(string: "https://itunes.apple.com/app/id1036098908") //엘페이앱
        case .hanaCard:
            url = URL(string: "http://itunes.apple.com/app/id847268987") //하나카드앱
        case .paybook:
            url = URL(string: "http://itunes.apple.com/kr/app/mobail-anjeongyeolje-isp/id369125087?mt=8") //페이북
        case .payco:
            url = URL(string: "http://itunes.apple.com/app/id924292102") //페이코앱
        case .kpay:
            url = URL(string : "https://itunes.apple.com/kr/app/id911636268") //Kpay앱
        case .hanamembers:
            url = URL(string : "http://itunes.apple.com/app/id1038288833?mt=8") //하나멤버스 앱
    
        }
        
        if UIApplication.shared.canOpenURL(url!){
            UIApplication.shared.open(url!,
                                      options: [:],
                                      completionHandler: nil)
        }
    }
}
