//
//  subcashView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 20/5/2564 BE.
//

import SwiftUI

struct subcashView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let num_formatter = InstanceData().num_formatter
    @State var balance_to_sub_string = ""
    @Binding var show : Bool
    @Binding var show_subcash : Bool
    var body: some View {
        VStack(spacing:20){
            Text("ลดเงินสด")
                .font(.largeTitle)
                .bold()
            Text("ลดเงินสดโดยไม่สร้างรายการ")
            HStack(spacing:25){
                Image("no-money")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:75,height: 90)
                VStack{
                    Text("เงินสดปัจจุบัน")
                    HStack(){
                        Text("\(num_formatter.string(from: NSNumber(value:Userwallet.get_wallet().get_cash()))!)")
                            .font(.title2)
                            .foregroundColor(Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)))
                            .padding(10)
                            .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.5)))
                            .cornerRadius(10)
                        Text("\(Userwallet.get_currency())")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.3979579806, green: 0.6449040771, blue: 0.2239966094, alpha: 1)))
                    }
                }
            }
            Divider()
            HStack(spacing:20){
                Text("ลด")
                TextField("0",text:$balance_to_sub_string)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .padding(10)
                    .frame(width:150,height: 50)
                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                    .cornerRadius(5)
                    .keyboardType(.numberPad)
                Text("\(Userwallet.get_currency())")
            }
            Divider()
            HStack(spacing:20){
                Text("รวม")
                Text("\(num_formatter.string(from: NSNumber(value:Userwallet.get_wallet().get_cash() - can_sub(cash_to_sub: balance_to_sub_string)))!)")
                    .font(.title2)
                    .foregroundColor(Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)))
                    .padding(10)
                    .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.5)))
                    .cornerRadius(10)
                Text("\(Userwallet.get_currency())")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.3979579806, green: 0.6449040771, blue: 0.2239966094, alpha: 1)))
            }
            Button(action:{
                withAnimation{
                    Userwallet.get_wallet().bate_cash(can_sub(cash_to_sub: balance_to_sub_string))
                    self.show.toggle()
                    self.show_subcash.toggle()
                    Userwallet.ena_tabView.toggle()
                }
            }){
                Text("บันทึก")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width:200,height: 40)
                    .background(Color(#colorLiteral(red: 0.9817287326, green: 0.3505361676, blue: 0.5024701357, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color:Color(#colorLiteral(red: 0.7777755857, green: 0.3773097396, blue: 0.3689020574, alpha: 1)),radius: 5)
                    .padding()
            }
            .disabled(can_sub_bool(cash_to_sub: balance_to_sub_string))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
    func can_sub_bool(cash_to_sub : String) -> Bool{
        if(Double(cash_to_sub) == nil){
            return true
        }
        return  false
    }
    func can_sub(cash_to_sub : String) -> Double{
        guard let sub_amount = Double(cash_to_sub) else{
            return 0
        }
        return sub_amount
    }
}

struct subcashView_Previews: PreviewProvider {
    static var previews: some View {
        subcashView(show:Binding.constant(false),show_subcash:Binding.constant(false)).environmentObject(Userwallet())
    }
}
