//
//  ContentView.swift
//  mywallet
//
//  Created by boom on 2/5/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var Userwallet : Userwallet
    @State private var selection = 0
    @State var add_list_show = false
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selection){
                    overallview().environmentObject(Userwallet)
                        .tag(0)
                    listView().environmentObject(Userwallet)
                        .tag(1)
                    Button(action:{
                        add_list_show.toggle()
                    }){}
                    .tag(2)
                    Text("สรุป")
                        .tag(3)
                    Text("ข้อมูล")
                        .tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Divider()
                
                if Userwallet.ena_tabView{
                    TabbarView(selection: $selection)
                        .transition(.opacity)
                }
                else{
                    
                }
            }
            .transition(.slide)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Userwallet())
    }
}

