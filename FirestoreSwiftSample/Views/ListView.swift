//
//  ListView.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView {
            VStack {
                LeftRow(text: "hogehoge")
                RightRow(text: "hogehoge")
            }
        }.padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
