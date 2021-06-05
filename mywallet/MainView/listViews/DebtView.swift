//
//  DebtView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 24/5/2564 BE.
//

import SwiftUI

struct DebtView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let data = InstanceData()
    let num_formatter = InstanceData().num_formatter
    var list : Aactivaty
    init(list:Aactivaty) {
        self.list = list
    }
    @State var show_detail = false
    var body: some View {
        VStack{
            HStack{
                Image(list.get_catagory())
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:60,height: 60)
                    .background(Color(#colorLiteral(red: 1, green: 0.4595823884, blue: 0.5358412862, alpha: 0.5)))
                    .cornerRadius(10)
                VStack(alignment:.leading){
                    Text("\(list.catagory)")
                        .font(.title)
                        .bold()
                    Text("\(num_formatter.string(from: NSNumber(value: list.get_amount()))!) \(Userwallet.get_currency())")
                        .font(.title3)
                        .bold()
                        .frame(alignment: .leading)
                        .padding(5)
                        .background(Color(#colorLiteral(red: 0.8603977561, green: 0.0507125631, blue: 0.1055282578, alpha: 0.5)))
                        .cornerRadius(10)
                }
                Spacer()
                Button(action:{
                    show_detail.toggle()
                }){
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)))
                    Text("เพิ่มเติม")
                        .foregroundColor(Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)))
                }
                .foregroundColor(.black)
                .frame(width:100,height: 40)
                .background(Color(#colorLiteral(red: 1, green: 0.626034677, blue: 0, alpha: 0.7040816327)))
                .cornerRadius(10)
                .fullScreenCover(isPresented: $show_detail, content: {
                    detailView(list,show_detail:$show_detail).environmentObject(Userwallet)
                })
            }
            .padding()
            VStack(alignment:.leading){
                HStack{
                    if list.status == true {
                        Text("\(list.get_paymethod())")
                    }
                    Spacer()
                    Text("สถานะการชำระ :")
                }
                HStack{
                    if list.status == true {
                        if list.get_paymethod() == "ชำระด้วยเงินสด"{
                            Image("money")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .background(Color(#colorLiteral(red: 0, green: 0.8609854579, blue: 0.1081084833, alpha: 0.5)))
                                .cornerRadius(10)
                                .padding()
                        }
                        if list.get_paymethod() == "ชำระด้วยบัญชีธนาคาร"{
                            Image("credit-card")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .background(Color(#colorLiteral(red: 0, green: 0.8609854579, blue: 0.1081084833, alpha: 0.5)))
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                    Spacer()
                    if list.status == true{
                        Image("correct")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .cornerRadius(10)
                            .padding()
                    }
                    else{
                        Image("wrong")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .padding(.horizontal)
            Text("\(data.day_formatter_th.string(from: list.get_Dates())) \(data.year_formatter.string(from: list.get_Dates())) \(list.get_time())")
                .frame(width:UIScreen.main.bounds.width*0.80,alignment: .trailing)
                .padding(.trailing,10)
                .padding(.bottom,15)
        }
        .frame(width:UIScreen.main.bounds.width*0.90)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 3)
        .padding(.horizontal)
        .padding(.top,10)
    }
}

struct DebtView_Previews: PreviewProvider {
    static var previews: some View {
        DebtView(list: Aactivaty(Date(),"test","test",100,"",Cash(),"",nil)).environmentObject(Userwallet())
    }
}
