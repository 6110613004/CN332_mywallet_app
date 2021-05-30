//
//  Cash.swift
//  mywallet
//
//  Created by boom on 3/5/2564 BE.
//

import Foundation

class Cash {
    private var cash_balance : Double
    init() {
        cash_balance = 0
    }
    
    func get_cash() -> Double {
        return self.cash_balance
    }
    
    func set_cash(_ cash : Double) {
        self.cash_balance = cash
    }
    
    func add_cash(_ cash : Double){
        self.cash_balance += cash
    }
    
    func bate_cash(_ cash : Double){
        self.cash_balance -= cash
    }
    
    static func pay() -> String {
        return "ชำระด้วยเงินสด"
    }
    
    static func gain() -> String {
        return "รับเงินสด"
    }
}
