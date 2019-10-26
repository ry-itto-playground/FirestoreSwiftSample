//
//  ContentView.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/24.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var showsSheet = false
    let manager = FirestoreManager()
    let document = MessageDocument(message: "fugafuga", userID: "123")

    var body: some View {
        VStack {
            ListView()
            Spacer()
            HStack {
                TextField(.init("hoge"), text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.manager.addMessage(document: self.document)
                }) {
                    Text("hoge")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
