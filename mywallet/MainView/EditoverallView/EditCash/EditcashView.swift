//
//  EditcashView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 15/5/2564 BE.
//

import SwiftUI

struct EditcashView: View {
    @EnvironmentObject var Userwallet : Userwallet
    @Binding var show : Bool
    @State var show_set_money = false
    @State var show_add_money = false
    @State var show_sub_money = false
    var body: some View {
        ZStack{
            if show{
                VStack{
                    VStack{
                        Text("เงินสด")
                            .font(.title)
                            .foregroundColor(.green)
                            .frame(height:40)
                        Text("จัดการเกี่ยวกับเงินสด")
                            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    }
                    .frame(width:400,height: 75)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)))
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    Divider()
                        .frame(width:500)
                    HStack{
                        VStack(alignment:.leading){
                            Text("แก้ไขจำนวนเงินสด")
                                .font(.title3)
                                .foregroundColor(Color(#colorLiteral(red: 0.3836692572, green: 0.09938011318, blue: 0.4323354959, alpha: 1)))
                        }
                        Spacer()
                            .frame(width:200)
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .offset(x:-10)
                    }
                    .frame(width:400,height:50)
                    .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.5)))
                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation{
                            self.show_set_money.toggle()
                        }
                    }
                    
                    HStack{
                        VStack(alignment:.leading){
                            Text("เพิ่มเงินสด")
                                .font(.title3)
                                .foregroundColor(Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)))
                        }
                        Spacer()
                            .frame(width:250)
                        Image("moneygain")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    .frame(width:400,height: 50)
                    .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.5)))
                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation{
                            self.show_add_money.toggle()
                        }
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("ลดเงินสด")
                                .font(.title3)
                                .foregroundColor(Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
                        }
                        Spacer()
                            .frame(width:250)
                        Image("no-money")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .offset(x:5)
                    }
                    .frame(width:400,height: 50)
                    .background(Color(#colorLiteral(red: 1, green: 0.3673712611, blue: 0.467107296, alpha: 0.5034013605)))
                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation{
                            self.show_sub_money.toggle()
                        }
                    }
                }
                .padding()
                .frame(width:UIScreen.main.bounds.width,height:325)
                .background(Color.white)
                .cornerRadius(20)
            }
            if show_set_money{
                GeometryReader{geo in
                    setcashView(show:$show_set_money,show_editcash:$show).environmentObject(Userwallet)
                        .frame(maxWidth:.infinity)
                        .offset(y:-UIScreen.main.bounds.height/4)
                }
                .background(
                    Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.65)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            withAnimation{
                                self.show_set_money.toggle()
                                Userwallet.ena_tabView.toggle()
                                self.show.toggle()
                            }
                        }
                )
            }
            if show_add_money{
                GeometryReader{geo in
                    addcashView(show:$show_add_money,show_addcash:$show).environmentObject(Userwallet)
                        .frame(maxWidth:.infinity)
                        .offset(y:-UIScreen.main.bounds.height/2.5)
                }
                .background(
                    Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.65)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            withAnimation{
                                self.show_add_money.toggle()
                                Userwallet.ena_tabView.toggle()
                                self.show.toggle()
                            }
                        }
                )
            }
            if show_sub_money{
                GeometryReader{geo in
                    subcashView(show:$show_sub_money,show_subcash:$show).environmentObject(Userwallet)
                        .frame(maxWidth:.infinity)
                        .offset(y:-UIScreen.main.bounds.height/2.5)
                }
                .background(
                    Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.65)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            withAnimation{
                                self.show_sub_money.toggle()
                                Userwallet.ena_tabView.toggle()
                                self.show.toggle()
                            }
                        }
                )
            }
            
        }
    }
    
}

struct EditcashView_Previews: PreviewProvider {
    static var previews: some View {
        EditcashView(show:Binding.constant(false)).environmentObject(Userwallet())
    }
}
