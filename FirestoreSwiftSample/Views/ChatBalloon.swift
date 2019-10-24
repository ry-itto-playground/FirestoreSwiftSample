//
//  ChatBalloon.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct ChatBalloon: View {
    let text: String

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.green)
                .cornerRadius(5)
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.regular)
                .lineLimit(0)
                .padding()
        }.frame(width: 200, height: 50, alignment: .center)
    }
}

struct ChatBalloon_Previews: PreviewProvider {
    static var previews: some View {
        ChatBalloon(text: "hoge")
    }
}
