//
//  setcashView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 15/5/2564 BE.
//

import SwiftUI

struct setcashView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let num_formatter = InstanceData().num_formatter
    @State var balance_string = ""
    @State var balance : Double?
    @Binding var show : Bool
    @Binding var show_editcash : Bool
    var body: some View {
        VStack(alignment: .leading){
            Text("แก้ไขจำนวนเงินสด")
                .font(.largeTitle)
                .bold()
            Spacer()
                .frame(height:50)
            Text("จำนวน")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack{
                TextField("\(num_formatter.string(from: NSNumber(value: Userwallet.get_wallet().get_cash()))!)",text: $balance_string )
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .frame(width:275,height: 35)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)))
                    .cornerRadius(5)
            }
            Button(action:{
                withAnimation{
                    Userwallet.get_wallet().set_cash(can_set(cash_to_set: balance_string))
                    show.toggle()
                    show_editcash.toggle()
                    Userwallet.ena_tabView.toggle()
                }
            }){
                Text("บันทึก")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width:250,height: 40)
                    .background(Color(#colorLiteral(red: 0, green: 0.8553975224, blue: 0.5535667539, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color:Color(#colorLiteral(red: 0, green: 0.5304697752, blue: 0.2698427737, alpha: 1)),radius: 5)
                    .padding()
            }
            .disabled(can_set_bool(cash_to_set: balance_string))
    
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
    func can_set_bool(cash_to_set : String) -> Bool{
        if(Double(cash_to_set) == nil){
            return true
        }
        return  false
    }
    func can_set(cash_to_set : String) -> Double{
        guard let set_amount = Double(cash_to_set) else{
            return 0
        }
        return set_amount
    }
}

struct setcashView_Previews: PreviewProvider {
    static var previews: some View {
        setcashView(show:Binding.constant(false),show_editcash:Binding.constant(false)).environmentObject(Userwallet())
    }
}
