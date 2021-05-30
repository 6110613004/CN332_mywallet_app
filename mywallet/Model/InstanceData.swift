//
//  InstanceData.swift
//  mywallet
//
//  Created by boom on 5/5/2564 BE.
//

import Foundation

struct InstanceData{
    let red_catagorys = ["food":"อาหาร","travel":"เดินทาง","bed":"ที่พัก","personal-care":"ของใช้ส่วนตัว",
                         "service":"บริการ","taken":"ถูกยืม","care":"ค่ารักษา","pet":"สัตว์เลี้ยง",
                         "family":"ครอบรัว","hobby":"งานอดิเรก","utility":"สาธารณูปโภค",
                         "vehicle":"ยานพาหนะ","busines":"ธุรกิจ","taxes":"ภาษี","newetc":"อื่นๆ","redbag":"หนี้สิน"]
                         
    let red = ["อาหาร","เดินทาง","ที่พัก","ของใช้ส่วนตัว",
                         "บริการ","ถูกยืม","ค่ารักษา","สัตว์เลี้ยง",
                         "ครอบรัว","งานอดิเรก","สาธารณูปโภค",
                         "ยานพาหนะ","ธุรกิจ","ภาษี","อื่นๆ","หนี้สิน"]
    
    let green = ["ได้รับคืน","พิเศษ","รายได้","ฟรี",
                           "ธุรกิจ ","ยืมมา","อื่นๆ ","รายรับค้างรับ"]
    
    let green_catagorys = ["taken":"ได้รับคืน","extra":"พิเศษ","money":"รายได้","free":"ฟรี",
                           "busines":"ธุรกิจ ","takens":"ยืมมา","newetc":"อื่นๆ","greenbag":"รายรับค้างรับ"]
    
    let catagory_thai = ["อาหาร":"food","เดินทาง":"travel","ที่พัก":"bed","ของใช้ส่วนตัว":"personal-care",
                         "บริการ":"service","ถูกยืม":"lending","ค่ารักษา":"care","สัตว์เลี้ยง":"pet",
                         "ครอบรัว":"family","งานอดิเรก":"hobby","สาธารณูปโภค":"utility","ยานพาหนะ":"vehicle",
                         "ธุรกิจ":"business","ภาษี":"taxes","อื่นๆ":"newetc","หนี้สิน":"redbag","ได้รับคืน":"getmoney",
                         "พิเศษ":"extra","รายได้":"money","ฟรี":"free",
                         "ธุรกิจ ":"business","ยืมมา":"lending","อื่นๆ ":"newetc","รายรับค้างรับ":"greenbag"]
    
    let dateformatter = DateFormatter()
    
    let day_formatter : DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd LLLL yyyy"
        return formater
    }()
    let month_formatter : DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "LLLL yyyy"
        return formater
    }()
    
    let day_formatter_th : DateFormatter = {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "th")
        formater.dateFormat = "dd MMM"
        return formater
    }()
    
    let month_formatter_th : DateFormatter = {
       let format = DateFormatter()
        format.locale = Locale(identifier: "th")
        format.dateFormat = "MMM"
        return format
    }()
    
    let year_formatter : DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy"
        return formater
    }()
    
    let num_formatter : NumberFormatter = {
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        formater.maximumFractionDigits = 2
        formater.decimalSeparator = "."
        return formater
    }()
    
    let date_formatter_time : DateFormatter = {
        let format = DateFormatter()
         format.dateFormat = "HH:mm"
         return format
        
    }()
    func dateformatTH() -> DateFormatter {
        dateformatter.locale = Locale(identifier: "th")
        return dateformatter
    }
    
}
