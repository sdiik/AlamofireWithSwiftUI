//
//  JokesView.swift
//  AlamofireWithSwiftUI
//
//  Created by ahmad shiddiq on 19/01/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import SwiftUI

struct JokesView: View {
    @ObservedObject var observed = JokesDataApi()
    var body: some View {
        NavigationView {
            List(observed.jokes) { i in
                HStack {
                    CircleImage(imageName: "icon_laughing", size: 50)
                    Text(i.joke).font(.system(size: 12))
                }
            }.navigationBarItems(trailing: Button(action: getJokes, label: { Text("More").bold().font(.system(size: 15)) }))
            .navigationBarTitle("Jokes")
        }
    }
    func getJokes() {
        observed.getJokes(count: 1)
    }
}

struct JokesView_Previews: PreviewProvider {
    static var previews: some View {
        JokesView()
    }
}
