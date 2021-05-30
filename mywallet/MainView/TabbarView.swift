//
//  TabbarView.swift
//  mywallet
//
//  Created by boom on 12/5/2564 BE.
//

import SwiftUI

struct TabbarView: View {
    @Binding var selection : Int
    @Namespace private var currentTab
    
    var body: some View {
        HStack{
            ForEach(tabs.indices){ index in
                GeometryReader{ geometry in
                    VStack(spacing:4){
                        if selection == index{
                            Color(.label)
                                .frame(height: 2 )
                                .offset(y:-8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                            Image(systemName: tabs[index].image)
                                .frame(height:20)
                                .rotationEffect(.degrees(0))
                        }
                        else{
                            Image(systemName: tabs[index].image)
                                .frame(height:20)
                                .rotationEffect(.degrees(0))
                        }
                        Text(tabs[index].label)
                            .font(.caption2)
                            .fixedSize()
                    }
                    .fixedSize(horizontal:false , vertical: true)
                    .frame(width: geometry.size.width / 2, height:44, alignment:.bottom)
                    .padding(.horizontal)
                    .foregroundColor(selection == index ? Color(.label) : .secondary)
                    .onTapGesture {
                        withAnimation{
                            selection = index
                        }
                    }
                }
                .frame(height: 44, alignment:.bottom)
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selection: Binding.constant(0))
    }
}

struct Tab {
    let image: String
    let label: String
}

let tabs = [
    Tab(image: "person.crop.rectangle.fill", label: "ภาพรวม"),
    Tab(image: "list.bullet.rectangle", label: "รายการ"),
    Tab(image: "plus",label:""),
    Tab(image: "square.grid.3x3.fill", label: "สรุป"),
    Tab(image: "creditcard.fill", label: "ข้อมูล")
]
