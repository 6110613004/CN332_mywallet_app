//
//  NewTabView.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 21/5/2564 BE.
//

import SwiftUI

struct NewTabView: View {
    @EnvironmentObject var Userwallet : Userwallet
    @State var selectedIndex = 0
    @State var show_add_list = false
    let icons = [
        "person.crop.rectangle.fill",
        "plus",
        "list.bullet.rectangle"
    ]
    var body: some View {
        VStack(spacing:0){
            // Content
            ZStack{
                
                EmptyView().fullScreenCover(isPresented: $show_add_list, content: {
                    AddActivityView(show_add:$show_add_list).environmentObject(Userwallet)
                })
                
                switch selectedIndex{
                case 0:
                    overallview().environmentObject(Userwallet)
                case 1:
                    EmptyView()
                default:
                    listView().environmentObject(Userwallet)
                }
                
            }
            
            Divider()
                .padding(10)
            if Userwallet.ena_tabView{
                HStack{
                    ForEach(0..<3, id: \.self) { number in
                        Spacer()
                        Button(action:{
                            if number == 1{
                                show_add_list.toggle()
                            }
                            else{
                                withAnimation{
                                    self.selectedIndex = number
                                }
                            }
                        }){
                            if number == 1 {
                                Image(systemName: icons[number])
                                    .font(.system(size:40,weight: .regular,design: .default))
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6563315392, blue: 0.1605705023, alpha: 1)))
                                    .frame(width: 60,height: 60)
                                    .background(Color(#colorLiteral(red: 0, green: 0.8973026276, blue: 0.2886893451, alpha: 1)))
                                    .cornerRadius(30)
                            }
                            else{
                                Image(systemName: icons[number])
                                    .font(.system(size:25,weight: .regular,design: .default))
                                    .foregroundColor(selectedIndex == number ? Color(.label) : Color(UIColor.lightGray))
                            }
                        }
                        Spacer()
                    }
                }
            }
            else{
                
            }
        }
    }
}

struct NewTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewTabView()
            .preferredColorScheme(.light)
            .environmentObject(Userwallet())
    }
}
