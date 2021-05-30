//
//  Userwallet.swift
//  mywallet
//
//  Created by boom on 2/5/2564 BE.
//

import Foundation

class Userwallet: ObservableObject {
    @Published var Account_name : String = ""
    @Published var firstname : String = ""
    @Published var lastname : String = ""
    @Published var Currency : String = ""
    @Published var Wallet = Cash()
    @Published var lists = [Aactivaty]()
    @Published var Bank_account = Account()
    @Published var Accrued_incomes = [Accrued_income]()
    @Published var Debts = [Debt]()
    var data = InstanceData()
    @Published var ena_tabView = true
    
    
    init(/*Account_name : String,firstname : String,lastname : String,Currency : String*/) {
        //self.Account_name = Account_name
        //self.firstname = firstname
        //self.lastname = lastname
        //self.Currency = Currency
        //self.Icon = "💳"
    }
    
    func set_account_name(newname : String){
        self.Account_name = newname
    }
    
    func get_account_name() -> String{
        return self.Account_name
    }
    
    
    
    func set_firstname(newfirstname : String) {
        self.firstname = newfirstname
    }
    
    func get_firstname() -> String{
        return self.firstname
    }
    
    func set_lastname(newlastname : String) {
        self.lastname = newlastname
    }
    
    func get_lastname() -> String {
        return self.lastname
    }
    
    func set_currency(newcurr : String){
        self.Currency = newcurr
    }
    
    func get_currency() -> String{
        return self.Currency
    }
    
    func get_wallet() -> Cash{
        return self.Wallet
    }
    
    func get_bank() -> Account{
        return self.Bank_account
    }
    
    func get_list() -> [Aactivaty] {
        return lists
    }
    
    func get_accrued_incomes() -> [Accrued_income] {
        return Accrued_incomes
    }
    
    func get_Debts() -> [Debt] {
        return Debts
    }
    
    func add_list(_ activity : Aactivaty){
        self.lists.append(activity)
    }
    
    func add_accrued_income(accrued_income : Accrued_income){
        self.Accrued_incomes.append(accrued_income)
    }
    
    func add_debt(debt : Debt){
        self.Debts.append(debt)
    }
    
    
    func today_list() -> Int {
        var count = 0
        for activity in lists{
            count += (data.day_formatter.string(from: activity.get_Dates()) == data.day_formatter.string(from: Date())) ? 1 : 0
        }
        return count
    }
    func today_list_income() -> Int{
        var count = 0
        for activity in lists{
            count += (data.day_formatter.string(from: activity.get_Dates()) == data.day_formatter.string(from: Date()) && activity.type == "green" && (activity.status == true || activity.status == nil)) ? 1 : 0
        }
        return count
    }
    func today_list_expense() -> Int{
        var count = 0
        for activity in lists{
            count += (data.day_formatter.string(from: activity.get_Dates()) == data.day_formatter.string(from: Date()) && activity.type == "red" && (activity.status == true || activity.status == nil)) ? 1 : 0
        }
        return count
    }
    func today_income() -> Double {
        var income : Double = 0
        for activity in lists{
            income += (data.day_formatter.string(from: activity.get_Dates()) == data.day_formatter.string(from: Date()) && activity.type == "green" && (activity.status == true || activity.status == nil)) ? activity.amount : 0
        }
        return income
    }
    func today_expense() -> Double {
        var expense : Double = 0
        for activity in lists{
            expense += (data.day_formatter.string(from: activity.get_Dates()) == data.day_formatter.string(from: Date()) && activity.type == "red" && (activity.status == true || activity.status == nil)) ? activity.amount : 0
        }
        return expense
    }
    func monthly_list() -> Int {
        var count = 0
        for activity in lists{
            count += (data.month_formatter.string(from: activity.get_Dates()) == data.month_formatter.string(from: Date())) ? 1 : 0
        }
        return count
    }
    func monthly_list_income() -> Int {
        var count = 0
        for activity in lists{
            count += (data.month_formatter.string(from: activity.get_Dates()) == data.month_formatter.string(from: Date()) && activity.type == "green" && (activity.status == true || activity.status == nil)) ? 1 : 0
        }
        return count
    }
    func monthly_list_expense() -> Int {
        var count = 0
        for activity in lists{
            count += (data.month_formatter.string(from: activity.get_Dates()) == data.month_formatter.string(from: Date()) && activity.type == "red" && (activity.status == true || activity.status == nil)) ? 1 : 0
        }
        return count
    }
    func monthly_income() -> Double {
        var income : Double = 0
        for activity in lists{
            income += (data.month_formatter.string(from: activity.get_Dates()) == data.month_formatter.string(from: Date()) && activity.type == "green" && (activity.status == true || activity.status == nil)) ? activity.amount : 0
        }
        return income
    }
    func monthly_expense() -> Double {
        var expense : Double = 0
        for activity in lists{
            expense += (data.month_formatter.string(from: activity.get_Dates()) == data.month_formatter.string(from: Date()) && activity.type == "red" && (activity.status == true || activity.status == nil)) ? activity.amount : 0
        }
        return expense
    }
    
    func get_accrued() -> Double{
        var amount : Double = 0
        for activity in lists{
            amount += (activity.type == "green" && activity.status == false ) ? activity.amount : 0
        }
        return amount
    }
    
    func get_debt() -> Double{
        var amount : Double = 0
        for activity in lists{
            amount += (activity.type == "red" && activity.status == false ) ? activity.amount : 0
        }
        return amount
    }
}
