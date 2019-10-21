//
//  ContentView.swift
//  sidebar-navigation
//
//  Created by Gavin Wiggins on 10/20/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var selection: String
    
    var body: some View {
        containedView()
    }
    
    private func containedView() -> AnyView {
        switch selection {
        case "🍎 Apple":
            return AnyView(AppleView())
        case "🍌 Banana":
            return AnyView(BananaView())
        case "🥥 Coconut":
            return AnyView(CoconutView())
        default:
            return AnyView(Text("Some view here").frame(maxWidth: .infinity, maxHeight: .infinity))
        }
    }
}

struct SidebarView: View {
    
    let items = ["🍎 Apple", "🍌 Banana", "🥥 Coconut", "🍒 Cherry", "🥜 Peanut", "🍑 Peach", "🍅 Tomato", "🍞 Bread", "🍕 Pizza", "🥦 Broccoli", "🥝 Kiwi", "🧀 Cheese", "🍉 Watermelon"]
    
    var body: some View {
        List(items, id: \.self) { item in
            NavigationLink(destination: DetailView(selection: item)) {
                Text("\(item)")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            DetailView(selection: "🍎 Apple")
        }
        .frame(height: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
