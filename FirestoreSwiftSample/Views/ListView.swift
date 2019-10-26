//
//  ListView.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        ScrollView {
            ForEach(viewModel.messages) { message in
                LeftRow(text: message.message)
            }
        }
        .padding()
        .onAppear {
            self.viewModel.onAppearSubject.send()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: .init())
    }
}
