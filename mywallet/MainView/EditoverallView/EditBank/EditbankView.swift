//
//  EditbankView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 20/5/2564 BE.
//

import SwiftUI

struct EditbankView: View {
    @EnvironmentObject var Userwallet : Userwallet
    let num_formatter = InstanceData().num_formatter
    @Binding var show : Bool
    @State var start_amount_string = ""
    @State var after_amount_string = ""
    @State var can_negative = false
    var body: some View {
        VStack(alignment:.leading){
            Group{
                Text("จัดการเงินในธนาคาร")
                    .font(.largeTitle)
                Spacer()
                    .frame(height:50)
                Text("คงเหลือ (เริ่มต้น)")
                    .font(.title)
                Text("* ค่านี้จะคงที่เสมอ")
                HStack{
                    TextField("\(num_formatter.string(from: NSNumber(value: Userwallet.get_bank().start_balance))!)",text: $start_amount_string)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.black)
                        .padding(10)
                        .frame(width:260)
                        .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                        .cornerRadius(5)
                    Text("\(Userwallet.get_currency())")
                        .font(.title3)
                        .bold()
                }
                Spacer()
                    .frame(height:50)
            }
            Text("คงเหลือ (ไม่รวมเริ่มต้น)")
                .font(.title)
            HStack{
                TextField("\(num_formatter.string(from: NSNumber(value: Userwallet.get_bank().after_balance))!)",text: $after_amount_string)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .padding(10)
                    .frame(width:260)
                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                    .cornerRadius(5)
                Text("\(Userwallet.get_currency())")
                    .font(.title3)
                    .bold()
            }
            Spacer()
                .frame(height:50)
            Text("คงเหลือ")
                .font(.title)
            HStack(){
                Text("\(num_formatter.string(from: NSNumber(value: can_add(cash:start_amount_string) + can_add(cash: after_amount_string)))!)")
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(#colorLiteral(red: 0.04457218945, green: 0.5548234582, blue: 0.2326195836, alpha: 1)))
                    .padding(10)
                    .frame(width:260 , alignment: .trailing)
                    .background(Color(#colorLiteral(red: 0, green: 1, blue: 0.5983120203, alpha: 0.5170068027)))
                    .cornerRadius(5)
                Text("\(Userwallet.get_currency())")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.776932776, blue: 0.3394612074, alpha: 1)))
            }
            Divider()
                .background(Color.gray)
                .frame(width:300,height: 30)
            Toggle(
                isOn: $can_negative, label: {
                    Text("ค่าคงเหลือติดลบได้")
                        .font(.title3)
                }
            )
            .frame(width:300)
            Divider()
                .background(Color.gray)
                .frame(width:300,height: 30)
            Button(action:{
                withAnimation{
                    self.show.toggle()
                    Userwallet.ena_tabView.toggle()
                    Userwallet.get_bank().set_account(start_balance: can_add(cash: start_amount_string), after_balance: can_add(cash: after_amount_string))
                    Userwallet.get_bank().can_be_negative = can_negative
                }
            }){
                Text("บันทึก")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width:275,height: 40)
                    .background(Color(#colorLiteral(red: 0, green: 0.8553975224, blue: 0.5535667539, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color:Color(#colorLiteral(red: 0, green: 0.5304697752, blue: 0.2698427737, alpha: 1)),radius: 5)
                    .padding()
            }
        }
        .padding()
        .frame(width:400)
        .background(Color.white)
        .cornerRadius(20)
    }
    func can_add_bool(cash : String) -> Bool{
        if(Double(cash) == nil){
            return true
        }
        return  false
    }
    func can_add(cash : String) -> Double{
        guard let amount = Double(cash) else{
            return 0
        }
        return amount
    }
}

struct EditbankView_Previews: PreviewProvider {
    static var previews: some View {
        EditbankView(show:Binding.constant(false)).environmentObject(Userwallet())
    }
}
