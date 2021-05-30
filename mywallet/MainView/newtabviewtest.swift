//
//  newtabviewtest.swift
//  mywallet
//
//  Created by Chanoknun Choosaksilp on 21/5/2564 BE.
//

import SwiftUI

struct newtabviewtest: View {
    @Binding var shownavlink : Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationLink(destination:Text("testnav"),isActive:$shownavlink){
            
        }
    }
}

struct newtabviewtest_Previews: PreviewProvider {
    static var previews: some View {
        newtabviewtest(shownavlink: Binding.constant(false))
    }
}
