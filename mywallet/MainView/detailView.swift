//
//  detailView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 14/5/2564 BE.
//

import SwiftUI

struct detailView: View {
    @EnvironmentObject var Userwallet : Userwallet
    @Binding var show_detail : Bool
    let data = InstanceData()
    let num_formatter = InstanceData().num_formatter
    var list : Aactivaty
    @State var selectdate : Date
    @State var type : String
    @State var catagory : String
    @State var amount_string : String
    @State var details : String
    @State var show_payment : Bool
    @State var status : Bool = false
    @State var money = false
    @State var bank = false
    init(_ list:Aactivaty,show_detail : Binding<Bool>) {
        self.list = list
        _show_detail = show_detail
        _selectdate = .init(initialValue: list.dateofAct)
        _type = .init(initialValue: list.type == "green" ? "รายรับ" : "รายจ่าย")
        _catagory = .init(initialValue: list.catagory)
        _amount_string = .init(initialValue: String(num_formatter.string(from: NSNumber(value: list.get_amount()))!))
        if list.get_special() == ""{
            _show_payment = .init(initialValue: true)
            if let mon = list.payment as? Cash{
                _money = .init(initialValue: true)
            }
            if let ban = list.payment as? Account{
                _bank = .init(initialValue: true)
            }
        }
        else{
            _show_payment = .init(initialValue: false)
            if let stat = list.status {
                _status = .init(initialValue: stat)
            }
            if list.payment != nil{
                if let mon = list.payment as? Cash{
                    _money = .init(initialValue: true)
                }
                if let ban = list.payment as? Account{
                    _bank = .init(initialValue: true)
                }
            }
        }
        _details = .init(initialValue: list.get_detail())
    }
    @State var is_nagetive = false
    var types : String {
        if type == "รายรับ"{
            return "green"
        }
        return "red"
    }
    //@State var is_nagetive = false
    //@State var not_payment = true
    var body: some View {
        ZStack{
            VStack{
                HStack(alignment:.center){
                    Button(action:{
                        self.show_detail.toggle()
                    }){
                        Image(systemName: "chevron.left")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:30,height: 30)
                            .padding()
                    }
                    Spacer()
                    Text("แก้ไขรายการ")
                        .font(.largeTitle)
                        .bold()
                        .offset(x:-30)
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
                            DatePicker("",selection: $selectdate)
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
                                    if list.special == ""{
                                        if type == "รายรับ"{
                                            ForEach(data.green, id:\.self){ g in
                                                if g != "รายรับค้างรับ"{
                                                    Text(g)
                                                        .tag(g)
                                                }
                                            }
                                        }
                                        else{
                                            ForEach(data.red, id:\.self){ r in
                                                if r != "หนี้สิน"{
                                                    Text(r)
                                                        .tag(r)
                                                }
                                            }
                                        }
                                    }
                                    else{
                                        if type == "รายรับ"{
                                            Text("รายรับค้างรับ")
                                                .tag("รายรับค้างรับ")
                                        }
                                        else{
                                            Text("หนี้สิน")
                                                .tag("หนี้สิน")
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

                            HStack(alignment:.center){
                                TextField(amount_string,text:$amount_string)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .frame(width:UIScreen.main.bounds.width*0.7)
                                    .background(Color(#colorLiteral(red: 0.7009605765, green: 0.7010801435, blue: 0.7009448409, alpha: 0.7823129252)))
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        self.amount_string = "0"
                                    }
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
                        else{
                            VStack(spacing:10){
                                HStack{
                                    Image("getmoney")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:50,height: 50)
                                    Text("สถานะการชำระ")
                                        .font(.title3)
                                        .bold()
                                        .padding(.leading,10)
                                    Spacer()
                                }
                                .padding(.leading,20)
                                .padding(.top,20)
                                Toggle(
                                    isOn: $status, label: {
                                        Text("สถานะการชำระ")
                                            .font(.title2)
                                            .bold()
                                        //.padding(.leading,20)
                                    }
                                )
                                .frame(width:UIScreen.main.bounds.width*0.9)
                                .padding(.top,10)
                                .padding(.bottom,20)
                            }
                            .frame(width:UIScreen.main.bounds.width,height: 130)
                            .background(Color(.white))
                            //.padding(.top,5)
                        }
                        if status == true{
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
                        HStack{
                            Button(action:{
                                set_list(self.selectdate, self.types, self.catagory, self.amount_string, detail: self.details, status: self.status, money: self.money, bank: self.bank)
                                show_detail.toggle()
                            }){
                                Text("บันทึก")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width:UIScreen.main.bounds.width*0.45,height:50)
                                    .background(Color(#colorLiteral(red: 0, green: 0.7925484776, blue: 0.4132778049, alpha: 1)))
                                    .cornerRadius(10)
                            }
                            .alert(isPresented: $is_nagetive, content: {
                                Alert(title:Text("จำนวนเงินเกินกว่าในบัญชี"))
                            })
                            .disabled(list.cou_sta >= 1 && !(status || (money || bank)))
                            Button(action:{
                                for i in 0..<Userwallet.lists.count{
                                    if list.id == Userwallet.lists[i].id{
                                        if Userwallet.lists[i].catagory != "รายรับค้างรับ" && Userwallet.lists[i].catagory != "หนี้สิน"{
                                            if money{
                                                Userwallet.lists[i].pay_back(Userwallet.get_wallet())
                                            }
                                            if bank{
                                                Userwallet.lists[i].pay_back(Userwallet.get_bank())
                                            }
                                        }
                                        else{
                                            if status{
                                                if money{
                                                    Userwallet.lists[i].pay_back(Userwallet.get_wallet())
                                                }
                                                if bank{
                                                    Userwallet.lists[i].pay_back(Userwallet.get_bank())
                                                }
                                            }
                                        }
                                        Userwallet.lists.remove(at: i)
                                        show_detail.toggle()
                                    }
                                }
                            }){
                                Text("ลบ")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width:UIScreen.main.bounds.width*0.45,height:50)
                                    .background(Color(#colorLiteral(red: 0.8472135067, green: 0.2116399407, blue: 0.2075031996, alpha: 1)))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.top,30)
                    }
                }
            }
            .background(Color(#colorLiteral(red: 0.9071269631, green: 0.9072791934, blue: 0.907106936, alpha: 1)))
            
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
            return list.get_amount()
        }
        return amount
    }
    func set_list(_ date:Date,_ types:String,_ catagory:String,_ amount:String,detail:String,status : Bool,money : Bool,bank : Bool){
        for i in 0..<Userwallet.lists.count{
            if list.id == Userwallet.lists[i].id{
                Userwallet.lists[i].set_date(date)
                Userwallet.lists[i].set_typeAndCatagory(types, catagory)
                Userwallet.lists[i].set_detail(detail)
                if catagory != "รายรับค้างรับ" && catagory != "หนี้สิน"{
                    if money {
                        Userwallet.lists[i].set_amount(can_add(cash: amount), payment: Userwallet.get_wallet())
                        Userwallet.lists[i].set_payment(Userwallet.get_wallet())
                    }
                    if bank{
                        if Userwallet.get_bank().can_be_negative {
                            Userwallet.lists[i].set_amount(can_add(cash: amount), payment: Userwallet.get_bank())
                            Userwallet.lists[i].set_payment(Userwallet.get_bank())
                        }
                        else{
                            if ((Userwallet.get_bank().get_balance() + Userwallet.lists[i].get_amount() - can_add(cash: amount_string) < 0) && type == "รายจ่าย"){
                                is_nagetive.toggle()
                            }
                            else{
                                Userwallet.lists[i].set_amount(can_add(cash: amount), payment: Userwallet.get_bank())
                                Userwallet.lists[i].set_payment(Userwallet.get_bank())
                            }
                        }
                    }
                }
                else{
                    if status && list.cou_sta < 1{
                        if money{
                            Userwallet.lists[i].pay(Userwallet.get_wallet())
                            Userwallet.lists[i].set_payment(Userwallet.get_wallet())
                            Userwallet.lists[i].status = true
                            Userwallet.lists[i].cou_sta += 1
                        }
                        if bank{
                            if Userwallet.get_bank().can_be_negative{
                                Userwallet.lists[i].pay(Userwallet.get_bank())
                                Userwallet.lists[i].set_payment(Userwallet.get_bank())
                                Userwallet.lists[i].status = true
                                Userwallet.lists[i].cou_sta += 1
                            }
                            else{
                                if ((Userwallet.get_bank().get_balance() - can_add(cash: amount_string) < 0) && type == "รายจ่าย"){
                                    is_nagetive.toggle()
                                }
                                else{
                                    Userwallet.lists[i].pay(Userwallet.get_bank())
                                    Userwallet.lists[i].set_payment(Userwallet.get_bank())
                                    Userwallet.lists[i].status = true
                                    Userwallet.lists[i].cou_sta += 1
                                }
                            }
                        }
                    }
                    if status && list.cou_sta >= 1{
                        if money{
                            Userwallet.lists[i].set_amount(can_add(cash: amount), payment: Userwallet.get_wallet())
                            Userwallet.lists[i].set_payment(Userwallet.get_wallet())
                            Userwallet.lists[i].status = true
                            Userwallet.lists[i].cou_sta += 1
                        }
                        if bank{
                            if Userwallet.get_bank().can_be_negative{
                                Userwallet.lists[i].set_amount(can_add(cash: amount), payment: Userwallet.get_bank())
                                Userwallet.lists[i].set_payment(Userwallet.get_bank())
                                Userwallet.lists[i].status = true
                                Userwallet.lists[i].cou_sta += 1
                            }
                            else{
                                if ((Userwallet.get_bank().get_balance() + Userwallet.lists[i].get_amount() - can_add(cash: amount_string) < 0) && type == "รายจ่าย"){
                                    is_nagetive.toggle()
                                }
                                else{
                                    Userwallet.lists[i].set_amount(can_add(cash: amount), payment: Userwallet.get_bank())
                                    Userwallet.lists[i].set_payment(Userwallet.get_bank())
                                    Userwallet.lists[i].status = true
                                    Userwallet.lists[i].cou_sta += 1
                                }
                            }
                        }
                    }
                    if status == false{
                        if Userwallet.lists[i].payment != nil{
                            if let mon = Userwallet.lists[i].payment as? Cash{
                                Userwallet.lists[i].pay_back(mon)
                                Userwallet.lists[i].status = false
                            }
                            if let ban = Userwallet.lists[i].payment as? Account{
                                Userwallet.lists[i].pay_back(ban)
                                Userwallet.lists[i].status = false
                            }
                        }
                    }
                }
            }
        }
    }
}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        detailView(Aactivaty(Date(),"test","test",100,"",Cash(),"",nil),show_detail: .constant(false)).environmentObject(Userwallet())
    }
}
