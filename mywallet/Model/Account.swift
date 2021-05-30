//
//  Account.swift
//  mywallet
//
//  Created by boom on 4/5/2564 BE.
//

import Foundation
class  Account{
    var start_balance : Double = 0
    var after_balance : Double = 0
    var balance : Double = 0
    var can_be_negative = false
    
    func deposit_cash(wallet : Cash , cash : Double){
        self.balance += cash
        wallet.bate_cash(cash)
    }
    
    
    func withdraw_cash(wallet : Cash,cash : Double){
        self.balance -= cash
        wallet.add_cash(cash)
    }
    
    func deposit_bank(_ amount : Double){
        self.balance += amount
    }
    
    func withdraw_bank(_ amount : Double){
        self.balance -= amount
    }
    
    func get_balance() -> Double{
        return self.balance
    }
    
    func tranfer(_ acc_to_tran : Account,_ amount : Double){
        self.balance -= amount
        acc_to_tran.deposit_bank(amount)
    }
    
    
    func set_account(start_balance : Double,after_balance: Double){
        self.start_balance = start_balance
        self.after_balance = after_balance
        self.balance = self.start_balance + self.after_balance
    }
    
    static func pay() -> String {
        return "ชำระด้วยบัญชีธนาคาร"
    }
    
    static func gain() -> String{
        return "รับเข้าธนาคาร"
    }
}
