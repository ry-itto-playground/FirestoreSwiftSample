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

    var action: () -> Void {
        return {
            let document = MessageDocument(message: self.inputText, userID: "hoge")
            _ = self.manager.addMessage(document: document)
        }
    }

    var body: some View {
        VStack {
            ListView()
            Spacer()
            HStack {
                TextField(.init("Message to send"), text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: action) {
                    Text("Send")
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
