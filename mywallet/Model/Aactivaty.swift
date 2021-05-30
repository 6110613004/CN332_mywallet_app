//
//  Aactivaty.swift
//  mywallet
//
//  Created by boom on 4/5/2564 BE.
//

import Foundation

struct Aactivaty : Identifiable{
    var id = UUID()
    var dateofAct: Date
    let dateformat : DateFormatter
    let data = InstanceData()
    var type : String
    var catagory : String
    var amount: Double
    var detail: String
    var payment : AnyObject?
    var special : String
    var status : Bool?
    var cou_sta = 0
    
    init(_ dateofAct : Date,_ type : String,_ catagory : String,_ amount : Double,_ detail: String,_ payment : AnyObject?,_ special : String,_ status: Bool?){
        self.dateofAct = dateofAct
        dateformat = data.dateformatTH()
        self.type = type
        self.catagory = catagory
        self.amount = amount
        self.detail = detail
        self.payment = payment
        self.special = special
        self.status = status
        if special == ""{
            pay(payment)
        }
    }
    
    func pay(_ payment : AnyObject?){
        if(type == "green"){
            if let cash = payment as? Cash{
                cash.add_cash(amount)
            }
            if let account = payment as? Account{
                account.deposit_bank(amount)
            }
        }
        else{
            if let cash = payment as? Cash{
                cash.bate_cash(amount)
            }
            if let account = payment as? Account{
                account.withdraw_bank(amount)
            }
            
        }
        
    }
    
    func pay_back(_ payment: AnyObject?){
        if(type == "green"){
            if let cash = payment as? Cash{
                cash.bate_cash(amount)
            }
            if let account = payment as? Account{
                account.withdraw_bank(amount)
            }
        }
        else{
            if let cash = payment as? Cash{
                cash.add_cash(amount)
            }
            if let account = payment as? Account{
                account.deposit_bank(amount)
            }
            
        }
    }
    
    func get_day() -> String {
        dateformat.dateFormat = "dd"
        return dateformat.string(from: dateofAct)
    }
    
    func get_month() -> String {
        dateformat.dateFormat = "LLLL"
        return dateformat.string(from: dateofAct)
    }
    
    func get_year() -> String {
        dateformat.dateFormat = "yyyy"
        return dateformat.string(from: dateofAct)
    }
    
    func get_time() -> String {
        dateformat.dateFormat = "HH:mm"
        return dateformat.string(from: dateofAct)
    }
    
    mutating func set_date(_ date: Date){
        self.dateofAct = date
    }
    
    mutating func set_typeAndCatagory(_ type: String,_ catagory: String){
        self.type = type
        self.catagory = catagory
    }
    
    mutating func set_amount(_ amount : Double,payment : AnyObject){
        pay_back(self.payment)
        self.amount = amount
        pay(payment)
    }
    
    mutating func set_detail(_ detail : String) {
        self.detail = detail
    }
    
    mutating func set_payment(_ payment : AnyObject){
        self.payment = payment
    }
    
    func get_Date() -> String {
        dateformat.dateFormat = "dd LLLL yyyy"
        return dateformat.string(from: dateofAct)
    }
    
    func get_month_year() -> String {
        dateformat.dateFormat = "LLLL yyyy"
        return dateformat.string(from: dateofAct)
    }
    
    func get_fullDate() -> String {
        dateformat.dateFormat = "dd MMM yyyy HH:mm"
        return dateformat.string(from: dateofAct)
    }
    
    func get_Dates() -> Date {
        return dateofAct
    }
    
    func get_type() -> String{
        return self.type
    }
    
    func get_catagory() -> String! {
        return data.catagory_thai[self.catagory]
    }
    
    func get_amount() -> Double {
        return self.amount
    }
    
    func get_detail() -> String {
        return self.detail
    }
    
    func get_paymethod() -> String {
        var method : String = ""
        if(type == "green"){
            if let cash = payment as? Cash{
                method = Cash.gain()
            }
            if let account = payment as? Account{
                method = Account.gain()
            }
        }
        else{
            if let cash = payment as? Cash{
                method = Cash.pay()
            }
            if let account = payment as? Account{
                method = Account.pay()
            }
        }
        return method
    }
    
    func get_special() -> String{
        return self.special
    }
}
