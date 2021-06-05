//
//  SearchView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 4/6/2564 BE.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let data = InstanceData()
    @State var keyword : String = ""
    @State var type_select : String =  "ทั้งหมด"
    @State var date_select_st : String = "ช่วง"
    @State var date_select = Date()
    @State var date_select_ran_ear = Date()
    @State var date_select_ran_lat = Date()
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 30,weight: .bold))
                        .foregroundColor(.gray)
                    TextField("Search", text: $keyword)
                }
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(Color.primary.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom,10)
                /*
                HStack{
                    Text("ทั้งหมด")
                        .font(.title3)
                        .bold()
                        .foregroundColor(type_select == "ทั้งหมด" ? Color.white : Color.gray)
                        .padding(.horizontal,20)
                        .padding(.vertical,5)
                        .background(type_select == "ทั้งหมด" ? Color(#colorLiteral(red: 0.2161393166, green: 0.225995332, blue: 0.2607323527, alpha: 1)) : Color.white.opacity(0))
                        .cornerRadius(30)
                        .onTapGesture {
                            self.type_select = "ทั้งหมด"
                        }
                    Text("รายรับ")
                        .font(.title3)
                        .bold()
                        .foregroundColor(type_select == "รายรับ" ? Color.white : Color.gray)
                        .padding(.horizontal,20)
                        .padding(.vertical,5)
                        .background(type_select == "รายรับ" ? Color(#colorLiteral(red: 0, green: 0.8452157974, blue: 0, alpha: 1)) : Color.white.opacity(0))
                        .cornerRadius(30)
                        .onTapGesture {
                            self.type_select = "รายรับ"
                        }
                    Text("รายจ่าย")
                        .font(.title3)
                        .bold()
                        .foregroundColor(type_select == "รายจ่าย" ? Color.white : Color.gray)
                        .padding(.horizontal,20)
                        .padding(.vertical,5)
                        .background(type_select == "รายจ่าย" ? Color(#colorLiteral(red: 0.9282436967, green: 0, blue: 0, alpha: 1)) : Color.white.opacity(0))
                        .cornerRadius(30)
                        .onTapGesture {
                            self.type_select = "รายจ่าย"
                        }
                }
                .padding(.horizontal,5)
                .padding(.vertical,3)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.bottom,10)
                
                HStack{
                    Text("ทั้งหมด")
                        .font(.title3)
                        .bold()
                        .foregroundColor(date_select_st == "ทั้งหมด" ? Color.white : Color.gray)
                        .padding(.horizontal,25)
                        .padding(.vertical,5)
                        .background(date_select_st == "ทั้งหมด" ? Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)) : Color.white.opacity(0))
                        .cornerRadius(30)
                        .onTapGesture {
                            self.date_select_st = "ทั้งหมด"
                        }
                    Text("วันที่")
                        .font(.title3)
                        .bold()
                        .foregroundColor(date_select_st == "วันที่" ? Color.white : Color.gray)
                        .padding(.horizontal,30)
                        .padding(.vertical,5)
                        .background(date_select_st == "วันที่" ? Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)) : Color.white.opacity(0))
                        .cornerRadius(30)
                        .onTapGesture {
                            self.date_select_st = "วันที่"
                        }
                    Text("ช่วง")
                        .font(.title3)
                        .bold()
                        .foregroundColor(date_select_st == "ช่วง" ? Color.white : Color.gray)
                        .padding(.horizontal,35)
                        .padding(.vertical,5)
                        .background(date_select_st == "ช่วง" ? Color(#colorLiteral(red: 0.74123317, green: 0.3403645754, blue: 0.8785151839, alpha: 1)) : Color.white.opacity(0))
                        .cornerRadius(30)
                        .onTapGesture {
                            self.date_select_st = "ช่วง"
                        }
                }
                .padding(.horizontal,5)
                .padding(.vertical,3)
                .background(Color.white)
                .cornerRadius(20)
                
                if date_select_st == "วันที่"{
                    DatePicker("",selection: $date_select, displayedComponents: [.date])
                        .accentColor(.black)
                        .offset(x:(-UIScreen.main.bounds.width/2)+65)
                        .padding(.vertical)
                }
                if date_select_st == "ช่วง" {
                    DatePicker("",selection: $date_select_ran_ear, displayedComponents: [.date])
                        .accentColor(.black)
                        .offset(x:(-UIScreen.main.bounds.width/2)-25,y:10)
                    DatePicker("",selection: $date_select_ran_lat, displayedComponents: [.date])
                        .accentColor(.black)
                        .offset(x:(-UIScreen.main.bounds.width/2)+150,y:-30)
                }
                */
            }
            .padding(.top,15)
            .padding(.bottom,date_select_st == "วันที่" ? -15 : 20)
            .padding(.bottom,date_select_st == "ช่วง" ? -20 : 20)
            .background(Color(#colorLiteral(red: 0, green: 0.8958531022, blue: 0.6146954894, alpha: 1)))
            ScrollView{
                LazyVStack{
                    if is_digit(){
                        ForEach(Userwallet.get_list().reversed().filter{$0.amount == amount_to_search()}){ list in
                            GeometryReader{ _ in
                                activity(list:list)
                            }
                            .frame(width:UIScreen.main.bounds.width,height:280)
                            .padding(.top,10)
                            .padding(.leading,10)
                        }
                    }
                    else if isnot_empty_st(){
                        ForEach(Userwallet.get_list().reversed().filter{$0.detail.lowercased().contains(keyword.lowercased())}){ list in
                            GeometryReader{ _ in
                                activity(list:list)
                            }
                            .frame(width:UIScreen.main.bounds.width,height:280)
                            .padding(.top,10)
                            .padding(.leading,10)
                        }
                    }
                    else{
                        ForEach(Userwallet.get_list().reversed()){list in
                            GeometryReader{ _ in
                                activity(list:list)
                            }
                            .frame(width:UIScreen.main.bounds.width,height:280)
                            .padding(.top,10)
                            .padding(.leading,10)
                        }
                    }
                }
            }
        }
    }
    func is_digit() -> Bool{
        if Double(keyword) != nil{
            return true
        }
        return false
    }
    func isnot_empty_st() -> Bool{
        if keyword != "" && Double(keyword) == nil{
            return true
        }
        return false
    }
    func amount_to_search() -> Double{
        guard let amount = Double(keyword) else {
            return 0
        }
        return amount
    }
    /*
    func filter_list() -> [Aactivaty]{
        if is_digit(){
            switch (type_select,date_select_st) {
            case ("ทั้งหมด","วันที่"):
                return Userwallet.get_list().reversed().filter{(activity:Aactivaty) -> Bool in
                    if activity.amount == amount_to_search() && activity.get_Date() == data.day_formatter.string(from: date_select){
                        return true
                    }
                    return false
                }
            case ("ทั้งหมด","ช่วง"):
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search() && ($0.get_Dates() > date_select_ran_ear && $0.get_Dates() < date_select_ran_lat)}
            case ("รายรับ","ทั้งหมด"):
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search() && $0.get_type() == "รายรับ"}
            case ("รายรับ","วันที่"):
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search() && $0.get_type() == "รายรับ" && $0.get_Date() == data.day_formatter.string(from: date_select)}
            case ("รายรับ","ช่วง"):
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search() && $0.get_type() == "รายรับ" && ($0.get_Dates() > date_select_ran_ear && $0.get_Dates() < date_select_ran_lat)}
            case ("รายจ่าย","ทั้งหมด"):
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search() && $0.get_type() == "รายจ่าย"}
            case ("รายจ่าย","วันที่"):
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search() && $0.get_type() == "รายจ่าย" && $0.get_Date() == data.day_formatter.string(from: date_select)}
            case ("รายจ่าย","ช่วง"):
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search() && $0.get_type() == "รายจ่าย" && ($0.get_Dates() > date_select_ran_ear && $0.get_Dates() < date_select_ran_lat)}
            default:
                return Userwallet.get_list().reversed().filter{$0.amount == amount_to_search()}
            }
        }
        else if isnot_empty_st(){
            switch (type_select,date_select_st) {
            case ("ทั้งหมด","วันที่"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && $0.get_Date() == data.day_formatter.string(from: date_select)}
            case ("ทั้งหมด","ช่วง"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && ($0.get_Dates() > date_select_ran_ear && $0.get_Dates() < date_select_ran_lat)}
            case ("รายรับ","ทั้งหมด"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && $0.get_type() == "รายรับ"}
            case ("รายรับ","วันที่"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && $0.get_type() == "รายรับ" && $0.get_Date() == data.day_formatter.string(from: date_select)}
            case ("รายรับ","ช่วง"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && $0.get_type() == "รายรับ" && ($0.get_Dates() > date_select_ran_ear && $0.get_Dates() < date_select_ran_lat)}
            case ("รายจ่าย","ทั้งหมด"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && $0.get_type() == "รายจ่าย"}
            case ("รายจ่าย","วันที่"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && $0.get_type() == "รายจ่าย" && $0.get_Date() == data.day_formatter.string(from: date_select)}
            case ("รายจ่าย","ช่วง"):
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased()) && $0.get_type() == "รายจ่าย" && ($0.get_Dates() > date_select_ran_ear && $0.get_Dates() < date_select_ran_lat)}
            default:
                return Userwallet.get_list().reversed().filter{$0.get_detail().lowercased().contains(keyword.lowercased())}
            }
        }
        switch (type_select,date_select_st) {
        case ("ทั้งหมด","วันที่"):
            return Userwallet.get_list().reversed().filter{$0.get_Date() == data.day_formatter.string(from: date_select)}
        case ("ทั้งหมด","ช่วง"):
            return Userwallet.get_list().reversed().filter{($0.get_Dates() > date_select_ran_ear) && ($0.get_Dates() < date_select_ran_lat)}
        case ("รายรับ","ทั้งหมด"):
            return Userwallet.get_list().reversed().filter{$0.get_type() == "รายรับ"}
        case ("รายรับ","วันที่"):
            return Userwallet.get_list().reversed().filter{$0.get_type() == "รายรับ" && $0.get_Date() == data.day_formatter.string(from: date_select)}
        case ("รายรับ","ช่วง"):
            return Userwallet.get_list().reversed().filter{$0.get_type() == "รายรับ" && ($0.get_Dates() > date_select_ran_ear) && ($0.get_Dates() < date_select_ran_lat)}
        case ("รายจ่าย","ทั้งหมด"):
            return Userwallet.get_list().reversed().filter{$0.get_type() == "รายจ่าย"}
        case ("รายจ่าย","วันที่"):
            return Userwallet.get_list().reversed().filter{$0.get_type() == "รายจ่าย" && ($0.get_Date() == data.day_formatter.string(from: date_select))}
        case ("รายจ่าย","ช่วง"):
            return Userwallet.get_list().reversed().filter{$0.get_type() == "รายจ่าย" && ($0.get_Dates() > date_select_ran_ear) && ($0.get_Dates() < date_select_ran_lat)}
        default:
            return Userwallet.get_list().reversed()
        }
    }
 */
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(Userwallet())
    }
}
