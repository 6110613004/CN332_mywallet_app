//
//  summaryView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 14/5/2564 BE.
//

import SwiftUICharts
import SwiftUI

struct summaryView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let data = InstanceData()
    @State var show_type = "รวม"
    @State var income_showbar = true
    @State var income_showgrah = false
    var body: some View {
        VStack{
            VStack{
                Text("สรุป")
                    .font(.largeTitle)
                    .bold()
                Picker(
                    selection:$show_type,
                    label: Text("test")
                    ,
                    content:{
                        Text("รวม")
                            .tag("รวม")
                        Text("รายรับ")
                            .tag("รายรับ")
                        Text("รายจ่าย")
                            .tag("รายจ่าย")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:UIScreen.main.bounds.width*0.90)
                    .padding()
            }
            .frame(width:UIScreen.main.bounds.width,height:130)
            .background(Color(#colorLiteral(red: 0, green: 0.8924509883, blue: 0.484813273, alpha: 1)))
            ScrollView{
                LazyVStack{
                    if show_type == "รวม"{
                        VStack{
                            HStack{
                                Text("ทั้งหมด")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.bottom,5)
                            HStack{
                                Text("\(Userwallet.get_list().count) รายการ")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                    .frame(minWidth:110,minHeight: 30)
                                    .background(Color(#colorLiteral(red: 0.8383277059, green: 0.8193243146, blue: 0.8319755197, alpha: 1)))
                                    .cornerRadius(10)
                                    .padding(.leading)
                                Text("\(data.num_formatter.string(from: NSNumber(value:Userwallet.all_list_income().income - Userwallet.all_list_expense().expense))!) \(Userwallet.get_currency())")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor((Userwallet.all_list_income().income - Userwallet.all_list_expense().expense < 0) ? Color(#colorLiteral(red: 0.9241623282, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.05459854752, green: 0.6175454855, blue: 0.03130144998, alpha: 1)))
                                    .frame(minWidth:80,minHeight: 30)
                                    .background((Userwallet.all_list_income().income - Userwallet.all_list_expense().expense < 0) ? Color(#colorLiteral(red: 0.8271971941, green: 0, blue: 0, alpha: 0.24)) : Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
                                    .cornerRadius(10)
                                Spacer()
                            }
                            MultiLineChartView(data: [(Userwallet.amo_in_ex().income,GradientColors.green),(Userwallet.amo_in_ex().expense,GradientColor.init(start: Color(#colorLiteral(red: 1, green: 0.3711826205, blue: 0.7157390714, alpha: 1)), end: Color.red))], title:"รายรับ vs รายจ่าย" ,form: CGSize(width:UIScreen.main.bounds.width*0.9,height:240),dropShadow: true)
                                .padding()
                            VStack{
                                HStack(alignment:.center){
                                    VStack{
                                        Text("รายรับ")
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6773489118, blue: 0, alpha: 1)))
                                            .padding(.bottom,3)
                                            .padding(.leading)
                                        Text("\(Userwallet.all_list_income().list_in) รายการ")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6773489118, blue: 0, alpha: 0.4829931973)))
                                            .padding(.leading,20)
                                    }
                                    Spacer()
                                    Text("\(data.num_formatter.string(from: NSNumber(value: Userwallet.all_list_income().income))!) \(Userwallet.get_currency())")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6773489118, blue: 0, alpha: 1)))
                                        .padding()
                                }
                                .frame(width:UIScreen.main.bounds.width*0.9,height: 100)
                                .background(Color(#colorLiteral(red: 0, green: 0.6773489118, blue: 0, alpha: 0.25)))
                                .cornerRadius(20)
                                HStack(alignment:.center){
                                    VStack{
                                        Text("รายจ่าย")
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(Color(#colorLiteral(red: 0.9351790547, green: 0, blue: 0.1247128323, alpha: 1)))
                                            .padding(.bottom,3)
                                            .padding(.leading,20)
                                        Text("\(Userwallet.all_list_expense().list_ex) รายการ")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(Color(#colorLiteral(red: 0.9351790547, green: 0, blue: 0.1247128323, alpha: 0.4897959184)))
                                            .padding(.leading,20)
                                    }
                                    Spacer()
                                    Text("\(data.num_formatter.string(from: NSNumber(value:Userwallet.all_list_expense().expense))!) \(Userwallet.get_currency())")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(Color(#colorLiteral(red: 0.9351790547, green: 0, blue: 0.1247128323, alpha: 1)))
                                        .padding()
                                }
                                .frame(width:UIScreen.main.bounds.width*0.9,height: 100)
                                .background(Color(#colorLiteral(red: 0.9351790547, green: 0, blue: 0.1247128323, alpha: 0.2653061224)))
                                .cornerRadius(20)
                                .padding(.top,10)
                            }
                        }
                    }
                    if show_type == "รายรับ"{
                        HStack{
                            VStack{
                                Text("รายรับ")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7508468628, blue: 0.1272699535, alpha: 1)))
                                Text("\(Userwallet.all_list_income().list_in) รายการ")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                    .frame(minWidth:110,minHeight: 30)
                                    .background(Color(#colorLiteral(red: 0.8383277059, green: 0.8193243146, blue: 0.8319755197, alpha: 1)))
                                    .cornerRadius(10)
                                    .padding(.leading)
                            }
                            Spacer()
                            HStack{
                                Button(action:{
                                    if income_showbar != true{
                                        income_showbar.toggle()
                                        income_showgrah.toggle()
                                    }
                                }){
                                    Image(systemName: "chart.bar.fill")
                                        .font(.system(size: 30,weight: .regular,design: .default))
                                        .foregroundColor(income_showbar ? Color(#colorLiteral(red: 0, green: 0.7665600181, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                        .frame(width:50,height: 40)
                                        .background(income_showbar ? Color(#colorLiteral(red: 0, green: 0.7665600181, blue: 0, alpha: 0.3265306122)) : Color(#colorLiteral(red: 0.8916645646, green: 0.8918142915, blue: 0.8916448951, alpha: 1)))
                                        .cornerRadius(10)
                                }
                                Button(action:{
                                    if income_showgrah != true{
                                        income_showbar.toggle()
                                        income_showgrah.toggle()
                                    }
                                }){
                                    Image(systemName: "chart.pie.fill")
                                        .font(.system(size: 30,weight: .regular,design: .default))
                                        .foregroundColor(income_showgrah ? Color(#colorLiteral(red: 0, green: 0.7665600181, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                        .frame(width:50,height: 40)
                                        .background(income_showgrah ? Color(#colorLiteral(red: 0, green: 0.7665600181, blue: 0, alpha: 0.3265306122)) : Color(#colorLiteral(red: 0.8916645646, green: 0.8918142915, blue: 0.8916448951, alpha: 1)))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        if income_showbar{
                            BarChartView(data: ChartData(values:Userwallet.amo_date_income().all_in_am_st),title: "",style: ChartStyle(backgroundColor: Color.white, accentColor: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), gradientColor:GradientColor(start: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), end: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))), textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.gray),form: CGSize(width:UIScreen.main.bounds.width*0.9,height:300),valueSpecifier: "%.2f")
                                .padding()
                        }
                        if income_showgrah{
                            PieChartView(data: Userwallet.amo_date_income().all_in_am, title: "รายรับ", legend: nil, style: ChartStyle(backgroundColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), accentColor: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), secondGradientColor: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray), form: CGSize(width:UIScreen.main.bounds.width*0.9,height:240), dropShadow: true, valueSpecifier: "%.2f")
                                .padding()
                        }
                    }
                    if show_type == "รายจ่าย"{
                        HStack{
                            VStack{
                                Text("รายจ่าย")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.8057166934, green: 0.09848620743, blue: 0.1410466433, alpha: 1)))
                                Text("\(Userwallet.all_list_expense().list_ex) รายการ")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                    .frame(minWidth:110,minHeight: 30)
                                    .background(Color(#colorLiteral(red: 0.8383277059, green: 0.8193243146, blue: 0.8319755197, alpha: 1)))
                                    .cornerRadius(10)
                                    .padding(.leading)
                            }
                            Spacer()
                            HStack{
                                Button(action:{
                                    if income_showbar != true{
                                        income_showbar.toggle()
                                        income_showgrah.toggle()
                                    }
                                }){
                                    Image(systemName: "chart.bar.fill")
                                        .font(.system(size: 30,weight: .regular,design: .default))
                                        .foregroundColor(income_showbar ? Color(#colorLiteral(red: 0.8057166934, green: 0.09848620743, blue: 0.1410466433, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                        .frame(width:50,height: 40)
                                        .background(income_showbar ? Color(#colorLiteral(red: 0.8057166934, green: 0.09848620743, blue: 0.1410466433, alpha: 0.231292517)) : Color(#colorLiteral(red: 0.8916645646, green: 0.8918142915, blue: 0.8916448951, alpha: 1)))
                                        .cornerRadius(10)
                                }
                                Button(action:{
                                    if income_showgrah != true{
                                        income_showbar.toggle()
                                        income_showgrah.toggle()
                                    }
                                }){
                                    Image(systemName: "chart.pie.fill")
                                        .font(.system(size: 30,weight: .regular,design: .default))
                                        .foregroundColor(income_showgrah ? Color(#colorLiteral(red: 0.8057166934, green: 0.09848620743, blue: 0.1410466433, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                        .frame(width:50,height: 40)
                                        .background(income_showgrah ? Color(#colorLiteral(red: 0.8057166934, green: 0.09848620743, blue: 0.1410466433, alpha: 0.4761904762)) : Color(#colorLiteral(red: 0.8916645646, green: 0.8918142915, blue: 0.8916448951, alpha: 1)))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        if income_showbar{
                            BarChartView(data: ChartData(values:Userwallet.amo_date_expense().all_ex_am_st),title: "",style: ChartStyle(backgroundColor: Color.white, accentColor: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), gradientColor:GradientColor(start: Color(#colorLiteral(red: 0.9039460421, green: 0.09498796612, blue: 0.05979467928, alpha: 0.7482993197)), end: Color(#colorLiteral(red: 0.9608810544, green: 0, blue: 0.04299157858, alpha: 0.5170068027))), textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.gray),form: CGSize(width:UIScreen.main.bounds.width*0.9,height:300),valueSpecifier: "%.2f")
                                .padding()
                        }
                        if income_showgrah{
                            PieChartView(data: Userwallet.amo_date_expense().all_ex_am, title: "รายจ่าย", legend: nil, style: ChartStyle(backgroundColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), accentColor: Color(#colorLiteral(red: 0.9039460421, green: 0.09498796612, blue: 0.05979467928, alpha: 0.7482993197)), secondGradientColor: Color(#colorLiteral(red: 0.9608810544, green: 0, blue: 0.04299157858, alpha: 0.5170068027)), textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray), form: CGSize(width:UIScreen.main.bounds.width*0.9,height:240), dropShadow: true, valueSpecifier: "%.2f")
                                .padding()
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct summaryView_Previews: PreviewProvider {
    static var previews: some View {
        summaryView().environmentObject(Userwallet())
    }
}
