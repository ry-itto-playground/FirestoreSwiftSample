//
//  LeftRow.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/24.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct LeftRow: View {
    let text: String

    var body: some View {
        HStack {
            Image("capi1")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50, alignment: .leading)
                .scaledToFit()
            ChatBalloon(text: text)
            Spacer()
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LeftRow(text: "hogehoge")
        }
        .previewLayout(.sizeThatFits)
    }
}
