//
//  Accrued_income.swift
//  mywallet
//
//  Created by boom on 5/5/2564 BE.
//

import Foundation

class Accrued_income : ObservableObject{
    var status = false
    var name : String
    var catagory : String
    var amount_of_all : Double
    var received : Double
    var profit_amount : Double = 0
    var profit_received : Double = 0
    var detail : String?
    static var total : Double = 0
    
    init(name : String,catagory : String,amount_of_all : Double,received : Double,profit_amount : Double?,profit_received : Double?,detail : String?) {
        self.name = name
        self.catagory = catagory
        self.amount_of_all = amount_of_all
        self.received = received
        if let pro_amou = profit_amount {
            self.profit_amount = pro_amou
        }
        if let pro_received = profit_received {
            self.profit_received = pro_received
        }
        self.detail = detail
    }
    
    static func add_total(_ amount : Double){
        self.total += amount
    }
    
    static func subtract_total(_ amount : Double){
        self.total -= amount
    }
    
    static func get_total() -> Double{
        return self.total
    }
    
    func take_amount_with_cash(_ Userwallet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?) {
        self.received += amount
        self.amount_of_all -= amount
        if(self.amount_of_all == 0){
            self.status = true
        }
        //Userwallet.lists.append(Aactivaty(date,"green",self.catagory,amount,detail,Userwallet.get_wallet(),"รายรับค้างรับ"))
    }
    
    func take_amount_with_bank(_ Userwallet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?) {
        self.received += amount
        self.amount_of_all -= amount
        if(self.amount_of_all == 0){
            self.status = true
        }
        //Userwallet.lists.append(Aactivaty(date,"green",self.catagory,amount,detail,Userwallet.get_bank(),"รายรับค้างรับ"))
    }
    
    func take_profit_with_cash(_ Userwallet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?){
        self.profit_received += amount
        self.profit_amount -= amount
        //Userwallet.lists.append(Aactivaty(date,"green",self.catagory,amount,detail,Userwallet.get_wallet(),"รายรับค้างรับ"))
    }
    
    func take_profit_with_bank(_ Userwallet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?,acc_name : String){
        self.profit_received += amount
        self.profit_amount -= amount
        //Userwallet.lists.append(Aactivaty(date,"green",self.catagory,amount,detail,Userwallet.get_bank(),"รายรับค้างรับ"))
    }
    
    func set_name(name : String){
        self.name = name
    }
    
    func set_catagory(catagory : String) {
        self.catagory = catagory
    }
    
    func set_amount_of_all(amount : Double) {
        self.amount_of_all = amount
    }
    
    func set_received(received : Double) {
        self.received = received
    }
    
    func set_profit_amount(profit_amount : Double) {
        self.profit_amount = profit_amount
    }
    
    func set_profit_received(profit_received : Double)  {
        self.profit_received = profit_received
    }
    
    func set_detail(detail : String) {
        self.detail = detail
    }
    
    func get_name() -> String{
        return self.name
    }
    
    func get_catagory() -> String {
        return self.catagory
    }
    
    func get_amount_of_all() -> Double{
        return self.amount_of_all
    }
    
    func get_received() -> Double {
        return self.received
    }
    
    func get_profit_amount() -> Double {
        return self.profit_amount
    }
    
    func get_profit_received() -> Double {
        return self.profit_received
    }
    
    func get_detail() -> String? {
        return self.detail
    }
}
