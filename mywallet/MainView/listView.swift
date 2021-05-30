//
//  listView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 14/5/2564 BE.
//

import SwiftUI

struct listView: View {
    @EnvironmentObject var Userwallet : Userwallet
    @State var show_type = "รวม"
    let data = InstanceData()
    let num_formatter = InstanceData().num_formatter
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 1, green: 0.5794001222, blue: 0.1302672327, alpha: 1)
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    var body: some View {
        ZStack{
            VStack{
                VStack(spacing:0){
                    HStack(){
                    
                        Text("รายการของฉัน")
                            .font(.title)
                        
                    }
                    .frame(width:UIScreen.main.bounds.width,height:50)
                    Picker(
                        selection:$show_type,
                        label:
                            HStack{
                                Text("รายการที่แสดง :")
                                    .padding()
                                Text(show_type)
                                Spacer()
                                Image(systemName: "arrowtriangle.down.fill")
                                    .padding(.trailing,5)
                            }
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width:UIScreen.main.bounds.width*0.80,height:40)
                            .background(Color(#colorLiteral(red: 1, green: 0.5794001222, blue: 0.1302672327, alpha: 1)))
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        ,
                        content:{
                            Text("รวม")
                                .tag("รวม")
                            Text("รายรับ-รายจ่าย")
                                .tag("รายรับ-รายจ่าย")
                            Text("รายรับค้างรับ")
                                .tag("รายรับค้างรับ")
                            Text("หนี้สิน")
                                .tag("หนี้สิน")
                        })
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width:UIScreen.main.bounds.width*0.95)
                        .padding()
                    
                }
                .frame(width:UIScreen.main.bounds.width,height: 130)
                .background(Color(#colorLiteral(red: 0, green: 0.8924509883, blue: 0.484813273, alpha: 1)))
                ScrollView{
                    LazyVStack{
                        ForEach(Userwallet.get_list().reversed()){ list  in
                            if show_type == "รายรับ-รายจ่าย" && list.get_special() == ""{
                                GeometryReader{ geo in
                                    income_expenseView(list:list)
                                }
                                .frame(width:UIScreen.main.bounds.width,height:280)
                                .padding(.top,10)
                                .padding(.leading,10)
                            }
                            if show_type == "รายรับค้างรับ" && list.get_special() == "รายรับค้างรับ"{
                                GeometryReader{ _ in
                                    AccruedView(list:list)
                                }
                                .frame(width:UIScreen.main.bounds.width,height:280)
                                .padding(.top,10)
                                .padding(.leading,10)
                            }
                            if show_type == "หนี้สิน" && list.get_special() == "หนี้สิน"{
                                GeometryReader{ _ in
                                    DebtView(list:list)
                                }
                                .frame(width:UIScreen.main.bounds.width,height:280)
                                .padding(.top,10)
                                .padding(.leading,10)
                            }
                            if show_type == "รวม"{
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
    }
}

struct listView_Previews: PreviewProvider {
    static var previews: some View {
        listView().environmentObject(Userwallet())
    }
}

