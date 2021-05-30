//
//  Debt.swift
//  mywallet
//
//  Created by boom on 5/5/2564 BE.
//

import Foundation

class Debt {
    var status = false
    var name : String
    var catagory : String
    var amount_of_all : Double
    var taken : Double
    var profit_amount : Double = 0
    var profit_taken : Double = 0
    var detail : String?
    static var total : Double = 0
    
    init(name : String,catagory : String,amount_of_all : Double,taken : Double,profit_amount : Double?,profit_taken : Double?,detail : String?){
        self.name = name
        self.catagory = catagory
        self.amount_of_all = amount_of_all
        Debt.add_total(self.amount_of_all)
        self.taken = taken
        if let pro_amou = profit_amount {
            self.profit_amount = pro_amou
        }
        if let pro_taken = profit_taken {
            self.profit_taken = pro_taken
        }
        self.detail = detail
    }
    
    static func add_total(_ amount : Double){
        self.total += amount
    }
    
    static func subtract_total(_ amount : Double){
        self.total -= amount
    }
    
    static func get_total() -> Double {
        return self.total
    }
    
    func taken_amount_with_cash(_ Userwalet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?){
        self.taken += amount
        self.amount_of_all -= amount
        Debt.subtract_total(amount)
        if(self.amount_of_all == 0){
            self.status = true
        }
        //Userwalet.lists.append(Aactivaty(date,"red",self.catagory,amount,detail,Userwalet.get_wallet(),"หนี้สิน"))
    }
    
    func taken_amount_with_bank(_ Userwallet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?){
        self.taken += amount
        self.amount_of_all -= amount
        Debt.subtract_total(amount)
        if(self.amount_of_all == 0){
            self.status = true
        }
        //Userwallet.lists.append(Aactivaty(date,"red",self.catagory,amount,detail,Userwallet.get_bank(),"หนี้สิน"))
    }
    
    func taken_profit_with_cash(_ Userwallet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?){
        self.profit_taken += amount
        self.profit_amount -= amount
        //Userwallet.lists.append(Aactivaty(date,"red",self.catagory,amount,detail,Userwallet.get_wallet(),"หนี้สิน"))
    }
    
    func taken_profit_with_bank(_ Userwallet : Userwallet,_ amount : Double,_ date : Date,_ detail : String?){
        self.profit_taken += amount
        self.amount_of_all -= amount
        //Userwallet.lists.append(Aactivaty(date,"red",self.catagory,amount,detail,Userwallet.get_bank(),"หนี้สิน"))
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
    
    func set_taken(taken : Double) {
        self.taken = taken
    }
    
    func set_profit_amount(profit_amount : Double) {
        self.profit_amount = profit_amount
    }
    
    func set_profit_taken(profit_taken : Double)  {
        self.profit_taken = profit_taken
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
    
    func get_taken() -> Double {
        return self.taken
    }
    
    func get_profit_amount() -> Double {
        return self.profit_amount
    }
    
    func get_profit_taken() -> Double {
        return self.profit_taken
    }
    
    func get_detail() -> String? {
        return self.detail
    }
}
