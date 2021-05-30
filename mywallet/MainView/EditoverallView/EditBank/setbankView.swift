//
//  setbankView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 20/5/2564 BE.
//

import SwiftUI

struct setbankView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let num_formatter = InstanceData().num_formatter
    @State var balance_string = ""
    @State var balance : Double?
    @Binding var show : Bool
    @Binding var show_editbank : Bool
    var body: some View {
        VStack(alignment: .leading){
            Text("แก้ไขจำนวนเงิน")
                .font(.largeTitle)
                .bold()
            Spacer()
                .frame(height:50)
            Text("จำนวน")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack{
                TextField("\(num_formatter.string(from: NSNumber(value: Userwallet.get_bank().get_balance()))!)",text: $balance_string )
                    .frame(width:200,height: 35)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)))
                    .cornerRadius(5)
            }
            Button(action:{
                withAnimation{
                    Userwallet.get_bank().set_bank(can_add(cash_to_add: balance_string))
                    show.toggle()
                    show_editbank.toggle()
                    Userwallet.ena_tabView.toggle()
                }
            }){
                Text("บันทึก")
            }
            .disabled(can_add_bool(cash_to_add: balance_string))
    
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

struct setbankView_Previews: PreviewProvider {
    static var previews: some View {
        setbankView(show:Binding.constant(false),show_editbank:Binding.constant(false)).environmentObject(Userwallet())
    }
}
