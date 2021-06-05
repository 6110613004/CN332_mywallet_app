//
//  AddActivityView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 23/5/2564 BE.
//

import SwiftUI

struct AddActivityView: View {
    @EnvironmentObject var Userwallet : Userwallet
    @Binding var show_add : Bool
    let data = InstanceData()
    @State var selectdate = Date()
    @State var type = "รายจ่าย"
    var types : String {
        if type == "รายรับ"{
            return "green"
        }
        return "red"
    }
    @State var catagory = ""
    @State var amount_string = ""
    @State var special_enable = false
    @State var details = ""
    @State var show_payment = false
    @State var money = false
    @State var bank = false
    @State var is_nagetive = false
    @State var not_payment = true
    var body: some View {
        ZStack{
            VStack{
                HStack(alignment:.center){
                    Button(action:{
                        self.show_add.toggle()
                    }){
                        Image(systemName: "chevron.left")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:40,height: 40)
                            .padding()
                    }
                    Spacer()
                    Text("เพิ่มรายการ")
                        .font(.largeTitle)
                        .bold()
                        .offset(x:-35)
                    Spacer()
                }
                .frame(width:UIScreen.main.bounds.width,height: 75)
                .background(Color(#colorLiteral(red: 0, green: 0.8958531022, blue: 0.6146954894, alpha: 1)))
                ScrollView{
                    LazyVStack{
                        VStack(spacing:10){
                            HStack{
                                Image(systemName: "calendar")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:50,height: 50)
                                Text("วันที่และเวลาของรายการ")
                                    .font(.title3)
                                Spacer()
                            }
                            .padding(.leading,20)
                            //datepicker
                            DatePicker("กรุณาเลือกวันที่",selection: $selectdate)
                                .accentColor(.black)
                                .datePickerStyle(CompactDatePickerStyle())
                                .padding(.horizontal,20)
                                
                        }
                        .frame(width:UIScreen.main.bounds.width,height: 130)
                        .background(Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)))
                        .padding(.top,5)
                        VStack{
                            HStack{
                                Image("details")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:50,height: 50)
                                Text("หมวดหมู่")
                                    .font(.title3)
                                Spacer()
                            }
                            .padding(.leading,20)
                            Picker(
                                selection:$type,
                                label:
                                    Text("")
                                ,
                                content:{
                                    Text("รายรับ")
                                        .tag("รายรับ")
                                    Text("รายจ่าย")
                                        .tag("รายจ่าย")
                                })
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width:UIScreen.main.bounds.width*0.8)
                                .padding(.top,15)
                                .padding(.bottom,5)
                            if catagory == ""{
                                Text("**กรุณาเลือกหมวดหมู่**")
                                    .foregroundColor(.red)
                                    .bold()
                            }
                            Picker(
                                selection:$catagory,
                                label:
                                    HStack{
                                        Text("หมวดหมู่ :")
                                            .padding()
                                        Text(catagory)
                                        Spacer()
                                        Image(systemName: "arrowtriangle.down.fill")
                                            .padding(.trailing,5)
                                    }
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .frame(width:UIScreen.main.bounds.width*0.80,height:40)
                                    .background(type == "รายรับ" ? Color(#colorLiteral(red: 0.05721107125, green: 0.7325795293, blue: 0.375931412, alpha: 1)) : Color(#colorLiteral(red: 0.8998832107, green: 0.2274816036, blue: 0.2611739039, alpha: 1)))
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                ,
                                content:{
                                    if type == "รายรับ"{
                                        if money || bank{
                                            ForEach(data.green.reversed(), id:\.self){ g in
                                                if g != "รายรับค้างรับ"{
                                                    Text(g)
                                                        .tag(g)
                                                }
                                            }
                                        }
                                        else{
                                            ForEach(data.green.reversed(), id:\.self){ g in
                                                Text(g)
                                                    .tag(g)
                                            }
                                        }
                                    }
                                    else{
                                        if money || bank{
                                            ForEach(data.red.reversed(), id:\.self){ r in
                                                if r != "หนี้สิน"{
                                                    Text(r)
                                                        .tag(r)
                                                }
                                            }
                                        }
                                        else{
                                            ForEach(data.red.reversed(), id:\.self){ r in
                                                Text(r)
                                                    .tag(r)
                                            }
                                        }
                                    }
                                })
                                .pickerStyle(MenuPickerStyle())
                                .frame(width:UIScreen.main.bounds.width*0.8)
                                .padding(.top,5)
                        }
                        .frame(width:UIScreen.main.bounds.width,height: 220)
                        .background(Color.white)
                        .padding(.top,5)
                        VStack(alignment:.center){
                            HStack{
                                Image("moneygain")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:50,height: 50)
                                Text("จำนวน")
                                    .font(.title3)
                                    .bold()
                                    .padding(.leading,10)
                                Spacer()
                            }
                            .padding(.leading,20)
                            HStack{
                                if can_add_bool(cash: amount_string){
                                    Text("**กรุณาใส่จำนวนเงินที่ถูกต้อง**")
                                        .foregroundColor(.red)
                                        .frame(height:10)
                                        .padding(0)
                                }
                            }

                            HStack(alignment:.center){
                                TextField("0",text:$amount_string)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .frame(width:UIScreen.main.bounds.width*0.7)
                                    .background(can_add_bool(cash: amount_string) == true ? Color(#colorLiteral(red: 1, green: 0.03816751391, blue: 0.2220372856, alpha: 0.5)) : Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                                    .cornerRadius(5)
                                Text("\(Userwallet.get_currency())")
                                    .bold()
                            }
                            .padding(.top,10)
                        }
                        .frame(width:UIScreen.main.bounds.width,height: 160)
                        .background(Color.white)
                        .padding(.top,5)
                        if catagory != "รายรับค้างรับ" && catagory != "หนี้สิน"{
                            VStack(spacing:10){
                                HStack{
                                    Image("overall")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:50,height: 50)
                                    Text("วิธีการชำระเงิน")
                                        .font(.title3)
                                        .bold()
                                        .padding(.leading,10)
                                    Spacer()
                                }
                                .padding(.leading,20)
                                .padding(.top,20)
                                List{
                                    Toggle(
                                        isOn: $money, label: {
                                            Image("money")
                                                .resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:40,height: 40)
                                            if type == "รายจ่าย"{
                                                Text("ชำระด้วยเงินสด")
                                                    .font(.title2)
                                                    .bold()
                                            }
                                            else{
                                                Text("รับเงินสด")
                                                    .font(.title2)
                                                    .bold()
                                            }
                                                //.padding(.leading,20)
                                        }
                                    )
                                    .frame(width:UIScreen.main.bounds.width*0.9)
                                    .padding(.top,10)
                                    .disabled(bank)
                                    Toggle(
                                        isOn: $bank, label: {
                                            Image("credit-card")
                                                .resizable()
                                                .renderingMode(.original)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:40,height: 40)
                                            if type == "รายจ่าย"{
                                                Text("ชำระด้วยเงินในธนาคาร")
                                                    .font(.title2)
                                                    .bold()
                                            }
                                            else{
                                                Text("รับเงินเข้าธนาคาร")
                                                    .font(.title2)
                                                    .bold()
                                            }
                                                //.padding(.leading,20)
                                        }
                                    )
                                    .frame(width:UIScreen.main.bounds.width*0.9)
                                    .padding(.top,10)
                                    .disabled(money)
                                }
                            }
                            .frame(width:UIScreen.main.bounds.width,height: 220)
                            .background(Color(.white))
                            .padding(.top,5)
                        }
                        VStack{
                            HStack{
                                Image(systemName: "exclamationmark.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.blue)
                                    .frame(width:60,height: 60)
                                    .background(Color(#colorLiteral(red: 0.663431108, green: 0.7900285125, blue: 0.9636986852, alpha: 0.5)))
                                    .cornerRadius(30)
                                Text("รายละเอียด (ถ้ามี)")
                                    .font(.title2)
                                Spacer()
                            }
                            .padding(.leading,20)
                            TextEditor(text:$details)
                                .lineSpacing(5)
                                .foregroundColor(.black)
                                .frame(width:UIScreen.main.bounds.width*0.8,height: 130,alignment: .top)
                                .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                                .cornerRadius(10)
                        }
                        .padding(.top,10)
                        .padding(.bottom,120)
                    }
                }
            }
            .background(Color(#colorLiteral(red: 0.9071269631, green: 0.9072791934, blue: 0.907106936, alpha: 1)))
            
            //
            // Save button
            //
            Button(action: {
                if catagory == "รายรับค้างรับ" || catagory == "หนี้สิน"{
                    Userwallet.add_list(Aactivaty(selectdate,types,catagory,can_add(cash: amount_string),details,nil,catagory,false))
                    
                    show_add.toggle()
                }
                else{
                    if money {
                        Userwallet.add_list(Aactivaty(selectdate,types,catagory,can_add(cash: amount_string),details,Userwallet.get_wallet(),"",nil))
                        
                        show_add.toggle()
                    }
                    else{
                        if Userwallet.get_bank().can_be_negative{
                            Userwallet.add_list(Aactivaty(selectdate,types,catagory,can_add(cash: amount_string),details,Userwallet.get_bank(),"",nil))
                            
                            show_add.toggle()
                        }
                        else{
                            if ((Userwallet.get_bank().get_balance() - can_add(cash: amount_string) < 0) && type == "รายจ่าย"){
                                is_nagetive.toggle()
                            }
                            else{
                                Userwallet.add_list(Aactivaty(selectdate,types,catagory,can_add(cash: amount_string),details,Userwallet.get_bank(),"",nil))
                                show_add.toggle()
                            }
                        }
                    }
                }
            }){
                HStack(alignment:.center,spacing:15){
                    Image(systemName: "note.text.badge.plus")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                    Text("บันทึก")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(width:170,height: 60)
                .background(Color(#colorLiteral(red: 0, green: 0.7658643126, blue: 0.5054687858, alpha: 1)))
                .cornerRadius(20)
            }
            .disabled(can_add_bool(cash: amount_string) || catagory == "" || (!(money || bank) && !(catagory == "รายรับค้างรับ" || catagory == "หนี้สิน")) )
            .alert(isPresented: $is_nagetive, content: {
                Alert(title:Text("จำนวนเงินเกินกว่าในบัญชี"))
            })
            .offset(y:UIScreen.main.bounds.height/2*0.8)
            // End button
            
        }
    }
    func can_add_bool(cash : String) -> Bool{
        if(cash != "" && Double(cash) == nil){
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

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(show_add: Binding.constant(false)).environmentObject(Userwallet())
    }
}
