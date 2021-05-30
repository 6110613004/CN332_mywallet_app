//
//  EditaccView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 15/5/2564 BE.
//

import SwiftUI

struct EditaccView: View {
    @EnvironmentObject var Userwallet : Userwallet
    @Binding var show : Bool
    @State var account_name = ""
    @State var currency = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("แก้ไขบัญชี")
                .font(.largeTitle)
                .bold()
            Spacer()
                .frame(height:50)
            Text("ชื่อบัญชี")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            TextField("ชื่อ",text: $account_name)
                .frame(width:200,height: 35)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)))
                .cornerRadius(5)
            Text("สกุลเงิน")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            TextField("สกุลเงิน",text: $currency)
                .frame(width:200,height: 35)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)))
                .cornerRadius(5)
            Button(action:{
                withAnimation{
                    show.toggle()
                    Userwallet.ena_tabView.toggle()
                    Userwallet.set_account_name(newname: account_name)
                    Userwallet.set_currency(newcurr: currency)
                }
            }){
                Text("ยืนยัน")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width:200,height: 40)
                    .background(Color(#colorLiteral(red: 0, green: 0.8553975224, blue: 0.5535667539, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color:Color(#colorLiteral(red: 0, green: 0.5304697752, blue: 0.2698427737, alpha: 1)),radius: 5)
                    .padding()
            }
            .frame(width: 200, height: 100)
            .disabled((account_name == "") || (currency == ""))
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct EditaccView_Previews: PreviewProvider {
    static var previews: some View {
        EditaccView(show:Binding.constant(false)).environmentObject(Userwallet())
    }
}
