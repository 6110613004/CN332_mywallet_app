//
//  overallview.swift
//  mywallet
//
//  Created by boom on 13/5/2564 BE.
//

import SwiftUI

struct overallview: View {
    @EnvironmentObject var Userwallet : Userwallet
    let num_formatter = InstanceData().num_formatter
    let date_formatter : DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "LLLL"
        return formater
    }()
    @State var edit_account = false
    @State var edit_cash = false
    @State var edit_bank = false
    //@Binding var set_cash : Bool
    var body: some View {
        ZStack(){
            VStack{
                VStack(spacing:0){
                    Text("ภาพรวม")
                        .font(.largeTitle)
                        .bold()
                    HStack(){
                        Image("wallet")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding()
                        Text("\(Userwallet.get_account_name())")
                        Spacer()
                            .frame(height:0)
                    }
                }
                .frame(width:UIScreen.main.bounds.width,height: 120)
                .background(Color(#colorLiteral(red: 0, green: 0.8924509883, blue: 0.484813273, alpha: 1)))
                ScrollView{
                    LazyVStack{
                        VStack(alignment:.leading){
                            VStack(alignment:.leading){
                                HStack(alignment: .center, spacing: 20){
                                    Image("wallet")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 70, height: 70)
                                    Text("\(Userwallet.get_account_name())")
                                    Spacer()
                                    Button(action: {
                                        withAnimation{
                                            self.edit_account.toggle()
                                            Userwallet.ena_tabView.toggle()
                                        }
                                    }, label: {
                                        Image(systemName: "pencil")
                                        Text("แก้ไข")
                                    })
                                    .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                                    .frame(width:80,height: 40)
                                    .background(Color(#colorLiteral(red: 0.9642933011, green: 0.5989775658, blue: 0.2128625512, alpha: 0.5)))
                                    .cornerRadius(15)
                                }
                                Text("\(Userwallet.lists.count) รายการ")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                    .frame(width:80,height: 25)
                                    .background(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                                    .cornerRadius(20)
                            }
                            Group{
                                Divider()
                                    .frame(height:10)
                                HStack(){
                                    Image("money")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45, height: 45)
                                        .background(Color(#colorLiteral(red: 0, green: 0.8609854579, blue: 0.1081084833, alpha: 0.5)))
                                        .cornerRadius(10)
                                    Text("เงินสด")
                                    Spacer()
                                    Text("\(num_formatter.string(from: NSNumber(value: Userwallet.get_wallet().get_cash()))!) \(Userwallet.get_currency())")
                                        .frame(maxWidth:130,alignment: .trailing)
                                    Button(action: {
                                        withAnimation{
                                            self.edit_cash.toggle()
                                            Userwallet.ena_tabView.toggle()
                                        }
                                    })
                                    {
                                        Image(systemName: "ellipsis")
                                    }
                                    .foregroundColor(.black)
                                    .frame(width:30,height: 30)
                                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                    .cornerRadius(10)
                                }
                                Divider()
                                HStack(){
                                    Image("credit-card")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45, height: 45)
                                        .background(Color(#colorLiteral(red: 0, green: 0.6144276261, blue: 0.8705313802, alpha: 0.5)))
                                        .cornerRadius(10)
                                    Text("บัญชีธนาคาร")
                                    Spacer()
                                    Text(" \(num_formatter.string(from: NSNumber(value: Userwallet.get_bank().get_balance()))!) \(Userwallet.get_currency())")
                                        .frame(maxWidth:130,alignment: .trailing)
                                    Button(action: {
                                        withAnimation{
                                            self.edit_bank.toggle()
                                            Userwallet.ena_tabView.toggle()
                                        }
                                    }){
                                        Image(systemName: "ellipsis")
                                    }
                                    .foregroundColor(.black)
                                    .frame(width:30,height: 30)
                                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                    .cornerRadius(10)
                                }
                                Divider()
                                HStack(){
                                    Image("greenbag")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45, height: 45)
                                        .background(Color(#colorLiteral(red: 0, green: 0.8609854579, blue: 0.1081084833, alpha: 0.5)))
                                        .cornerRadius(10)
                                    Text("รายรับค้างรับ")
                                    Spacer()
                                    Text("\(num_formatter.string(from: NSNumber(value:Userwallet.get_accrued()))!) \(Userwallet.get_currency())")
                                        .frame(maxWidth:130,alignment: .trailing)
                                    Button(action: {
                                        
                                    }){
                                        Image(systemName: "ellipsis")
                                    }
                                    .foregroundColor(.black)
                                    .frame(width:30,height: 30)
                                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                    .cornerRadius(10)
                                }
                                Divider()
                                HStack(){
                                    Image("redbag")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45, height: 45)
                                        .background(Color(#colorLiteral(red: 0.8837482333, green: 0.1669845581, blue: 0.4119730592, alpha: 0.5)))
                                        .cornerRadius(10)
                                    Text("หนี้สิน")
                                    Spacer()
                                    Text("\(num_formatter.string(from: NSNumber(value: Userwallet.get_debt()))!) \(Userwallet.get_currency())")
                                        .frame(maxWidth:130,alignment: .trailing)
                                    Button(action: {
                                        
                                    }){
                                        Image(systemName: "ellipsis")
                                    }
                                    .foregroundColor(.black)
                                    .frame(width:30,height: 30)
                                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                    .cornerRadius(10)
                                }
                                Divider()
                            }
                            HStack(){
                                Text("รวม")
                                Spacer()
                                Text("\(num_formatter.string(from: NSNumber(value: Userwallet.get_wallet().get_cash() + Userwallet.get_bank().get_balance() + Userwallet.get_accrued() - Userwallet.get_debt()))!) \(Userwallet.get_currency())")
                            }
                            Divider()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .padding()
                        .shadow(radius: 5)
                        
                        VStack(alignment: .leading){
                            HStack(spacing: 20){
                                Image(systemName: "calendar")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:50,height: 50)
                                    //.background(Color(#colorLiteral(red: 0, green: 1, blue: 0.6890006065, alpha: 0.5)))
                                    .cornerRadius(10)
                                VStack(alignment:.leading){
                                    Text("วันนี้")
                                    Text("\(Userwallet.today_list()) รายการ  \(num_formatter.string(from: NSNumber(value:Userwallet.today_income() - Userwallet.today_expense()))!) \(Userwallet.get_currency())")
                                }
                                Spacer()
                                Text("\(Userwallet.data.day_formatter_th.string(from: Date())) \(Userwallet.data.year_formatter.string(from: Date()))")
                                    .offset(y:-20)
                            }
                            HStack{
                                VStack(alignment:.leading){
                                    Text("รายรับ")
                                    Text("จำนวน \(Userwallet.today_list_income()) รายการ")
                                }
                                Spacer()
                                Text("\(num_formatter.string(from: NSNumber(value:Userwallet.today_income()))!) \(Userwallet.get_currency())")
                            }
                            .padding()
                            .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 0.7517006803)))
                            .cornerRadius(20.0)
                            HStack{
                                VStack(alignment:.leading){
                                    Text("รายจ่าย")
                                    Text("จำนวน \(Userwallet.today_list_expense()) รายการ")
                                }
                                Spacer()
                                Text("\(num_formatter.string(from: NSNumber(value: Userwallet.today_expense()))!) \(Userwallet.get_currency())")
                            }
                            .padding()
                            .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                            .cornerRadius(20.0)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .padding()
                        .shadow(radius: 5)
                        VStack(alignment: .leading){
                            HStack(spacing: 20){
                                Image(systemName: "calendar")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:50,height: 50)
                                    //.background(Color(#colorLiteral(red: 0, green: 1, blue: 0.6890006065, alpha: 0.5)))
                                    .cornerRadius(10)
                                VStack(alignment:.leading){
                                    Text("เดือนนี้")
                                    Text("\(Userwallet.monthly_list()) รายการ  \(num_formatter.string(from: NSNumber(value:Userwallet.monthly_income() - Userwallet.monthly_expense()))!) \(Userwallet.get_currency())")
                                }
                                Spacer()
                                Text("\(Userwallet.data.month_formatter_th.string(from: Date())) \(Userwallet.data.year_formatter.string(from: Date()))")
                                    .offset(y:-20)
                            }
                            HStack{
                                VStack(alignment:.leading){
                                    Text("รายรับ")
                                    Text("จำนวน \(Userwallet.monthly_list_income()) รายการ")
                                }
                                Spacer()
                                Text("\(num_formatter.string(from: NSNumber(value:Userwallet.monthly_income()))!) \(Userwallet.get_currency())")
                            }
                            .padding()
                            .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 0.7517006803)))
                            .cornerRadius(20.0)
                            HStack{
                                VStack(alignment:.leading){
                                    Text("รายจ่าย")
                                    Text("จำนวน \(Userwallet.monthly_list_expense()) รายการ")
                                }
                                Spacer()
                                Text("\(num_formatter.string(from: NSNumber(value: Userwallet.monthly_expense()))!) \(Userwallet.get_currency())")
                            }
                            .padding()
                            .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                            .cornerRadius(20.0)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .padding()
                        .shadow(radius: 5)
                    }
                }
                .padding(0)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
            }
            if self.edit_account{
                GeometryReader{ geo in
                    EditaccView(show:$edit_account).environmentObject(Userwallet)
                        .frame(maxWidth:.infinity,maxHeight: UIScreen.main.bounds.height)
                }
                .background(
                    Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation{
                                self.edit_account.toggle()
                                Userwallet.ena_tabView.toggle()
                            }
                        }
                )
                .transition(.opacity)
            }
            if self.edit_cash{
                GeometryReader{ geo in
                    EditcashView(show:$edit_cash).environmentObject(Userwallet)
                        .offset(y:UIScreen.main.bounds.height-400)
                }
                .background(
                    Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.65)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            withAnimation{
                                self.edit_cash.toggle()
                                Userwallet.ena_tabView.toggle()
                            }
                        }
                )
                .transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom), removal: AnyTransition.move(edge: .bottom)))
            }
            
            if self.edit_bank{
                GeometryReader{ geo in
                    EditbankView(show:$edit_bank).environmentObject(Userwallet)
                        .frame(maxWidth:.infinity,maxHeight: UIScreen.main.bounds.height)
                }
                .background(
                    Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.65)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            withAnimation{
                                self.edit_bank.toggle()
                                Userwallet.ena_tabView.toggle()
                            }
                        }
                )
                .transition(.asymmetric(insertion: .opacity, removal: AnyTransition.move(edge: .bottom)))
            }
        }
        .font(Font.custom("Open Sans",size: 17))
    }
}

struct overallview_Previews: PreviewProvider {
    static var previews: some View {
        overallview()
            .environmentObject(Userwallet())
    }
}
