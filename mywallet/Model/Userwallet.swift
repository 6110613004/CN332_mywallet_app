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
    
    func all_list_income() -> (list_in:Int,income:Double) {
        var count : Int = 0
        var income : Double = 0
        for activity in lists{
            count += (activity.type == "green" && (activity.status == true || activity.status == nil)) ? 1 : 0
            income += (activity.type == "green" && (activity.status == true || activity.status == nil)) ? activity.get_amount() : 0
        }
        return (count,income)
    }
    
    func all_list_expense() -> (list_ex:Int,expense:Double) {
        var count : Int = 0
        var expense : Double = 0
        for activity in lists{
            count += (activity.type == "red" && (activity.status == true || activity.status == nil)) ? 1 : 0
            expense += (activity.type == "red" && (activity.status == true || activity.status == nil)) ? activity.amount : 0
        }
        return (count,expense)
    }
    
    func amo_in_ex() -> (income:[Double],expense:[Double]){
        var income : [Double] = []
        var expense : [Double] = []
        var sort_date = lists
        if lists.count != 0{
            for i in 1..<lists.count{
                let activity = sort_date[i]
                var j : Int = i - 1
                while j >= 0 && sort_date[j].get_Dates() > activity.get_Dates() {
                    sort_date[j + 1] = sort_date[j]
                    j = j - 1
                }
                sort_date[j + 1] = activity
            }
        }
        for activity in sort_date{
            if activity.get_type() == "green" && (activity.status == true || activity.status == nil){
                income.append(activity.get_amount())
            }
            if activity.get_type() == "red" && (activity.status == true || activity.status == nil){
                expense.append(activity.get_amount())
            }
        }
        return (income,expense)
    }
    func amo_date_income() -> (all_in_am:[Double],all_in_am_st:[(String,Double)]){
        var all_in_am : [Double] = []
        var all_in_am_st : [(String,Double)] = []
        var sort_date = lists
        if lists.count != 0{
            for i in 1..<lists.count{
                let activity = sort_date[i]
                var j : Int = i - 1
                while j >= 0 && sort_date[j].get_Dates() > activity.get_Dates() {
                    sort_date[j + 1] = sort_date[j]
                    j = j - 1
                }
                sort_date[j + 1] = activity
            }
        }
        for activity in sort_date{
            if (activity.type == "green" && (activity.status == true || activity.status == nil)){
                all_in_am.append(activity.get_amount())
                all_in_am_st.append((activity.get_fullDate(),activity.get_amount()))
            }
        }
        return (all_in_am,all_in_am_st)
    }
    func amo_date_expense() -> (all_ex_am:[Double],all_ex_am_st:[(String,Double)]){
        var all_ex_am : [Double] = []
        var all_ex_am_st : [(String,Double)] = []
        var sort_date = lists
        if lists.count != 0{
            for i in 1..<lists.count{
                let activity = sort_date[i]
                var j : Int = i - 1
                while j >= 0 && sort_date[j].get_Dates() > activity.get_Dates() {
                    sort_date[j + 1] = sort_date[j]
                    j = j - 1
                }
                sort_date[j + 1] = activity
            }
        }
        for activity in sort_date{
            if (activity.type == "red" && (activity.status == true || activity.status == nil)){
                all_ex_am.append(activity.get_amount())
                all_ex_am_st.append((activity.get_fullDate(),activity.get_amount()))
            }
        }
        return (all_ex_am,all_ex_am_st)
    }
    
}
