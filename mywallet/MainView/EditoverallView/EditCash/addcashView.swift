//
//  addcashView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 19/5/2564 BE.
//

import SwiftUI

struct addcashView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let num_formatter = InstanceData().num_formatter
    @State var balance_to_add_string = ""
    @Binding var show : Bool
    @Binding var show_addcash : Bool
    var body: some View {
        VStack(spacing:20){
            Text("เพิ่มเงินสด")
                .font(.largeTitle)
                .bold()
            Text("เพิ่มเงินสดโดยไม่สร้างรายการ")
            HStack(spacing:25){
                Image("moneygain")
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
                Text("เพิ่ม")
                TextField("0",text:$balance_to_add_string)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .padding(10)
                    .frame(width:150,height: 50)
                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                    .cornerRadius(5)
                Text("\(Userwallet.get_currency())")
            }
            Divider()
            HStack(spacing:20){
                Text("รวม")
                Text("\(num_formatter.string(from: NSNumber(value:Userwallet.get_wallet().get_cash() + can_add(cash_to_add: balance_to_add_string)))!)")
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
                    Userwallet.get_wallet().add_cash(can_add(cash_to_add: balance_to_add_string))
                    self.show.toggle()
                    self.show_addcash.toggle()
                    Userwallet.ena_tabView.toggle()
                }
            }){
                Text("บันทึก")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width:200,height: 40)
                    .background(Color(#colorLiteral(red: 0, green: 0.8553975224, blue: 0.5535667539, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color:Color(#colorLiteral(red: 0, green: 0.5304697752, blue: 0.2698427737, alpha: 1)),radius: 5)
                    .padding()
            }
            .disabled(can_add_bool(cash_to_add: balance_to_add_string))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
    func can_add_bool(cash_to_add : String) -> Bool{
        if(Double(cash_to_add) == nil){
            return true
        }
        return  false
    }
    func can_add(cash_to_add : String) -> Double{
        guard let add_amount = Double(cash_to_add) else{
            return 0
        }
        return add_amount
    }
}

struct addcashView_Previews: PreviewProvider {
    static var previews: some View {
        addcashView(show:Binding.constant(false),show_addcash:Binding.constant(false)).environmentObject(Userwallet())
    }
}
