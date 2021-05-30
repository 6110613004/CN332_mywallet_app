//
//  FirstView.swift
//  mywallet
//
//  Created by boom on 13/5/2564 BE.
//

import SwiftUI

struct FirstView: View {
    @State private var acc_name = ""
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var currency = ""
    @State private var action = false
    @EnvironmentObject var Userwallet : Userwallet
    var body: some View {
        NavigationView{
            VStack(alignment:.leading,spacing:50){
                TextField("ชื่อบัญชี",text: $acc_name)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width:250,height: 50)
                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                    .cornerRadius(10)
                TextField("ชื่อ",text: $firstname)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width:250,height: 50)
                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                    .cornerRadius(10)
                TextField("นามสกุล",text: $lastname)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width:250,height: 50)
                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                    .cornerRadius(10)
                TextField("สกุลเงิน",text: $currency)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width:250,height: 50)
                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                    .cornerRadius(10)
                
                Button(action: {
                    withAnimation{
                        Userwallet.set_account_name(newname: acc_name)
                        Userwallet.set_firstname(newfirstname: firstname)
                        Userwallet.set_lastname(newlastname: lastname)
                        Userwallet.set_currency(newcurr: currency)
                        action.toggle()
                    }
                },
                       label: {
                    Text("ยืนยัน")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width:UIScreen.main.bounds.width*0.50,height:50)
                        .background(Color(#colorLiteral(red: 0, green: 0.7925484776, blue: 0.4132778049, alpha: 1)))
                        .cornerRadius(10)
                }
                )
                .fullScreenCover(isPresented: $action){
                    NewTabView().environmentObject(Userwallet)
                }
                .disabled((acc_name == "") || (firstname == "") || (lastname == "") || (currency == ""))
            }
            .padding(50)
            .navigationTitle("กรอกข้อมูลเริ่มต้น")
        }
        .background(Color(#colorLiteral(red: 0.6921291351, green: 0.7853503823, blue: 1, alpha: 1)))
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
