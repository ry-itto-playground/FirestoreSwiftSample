//
//  Row.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/24.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct Row: View {
    let text: String
    let left: Bool

    var body: some View {
        HStack {
            if left {
                Image("capi1")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50, alignment: .leading)
                    .scaledToFit()
            }
            Text(text)
            if !left {
                Image("capi2")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50, alignment: .leading)
                    .scaledToFit()
            }
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Row(text: "hogehoge", left: true)
            Row(text: "fugafuga", left: false)
        }
        .previewLayout(.sizeThatFits)
    }
}
