//
//  RightRow.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct RightRow: View {
    let text: String

    var body: some View {
        HStack {
            Spacer()
            ChatBalloon(text: text)
            Image("capi2")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50, alignment: .leading)
                .scaledToFit()
        }
    }
}

struct RightRow_Previews: PreviewProvider {
    static var previews: some View {
        RightRow(text: "fuga")
            .previewLayout(.sizeThatFits)
    }
}
