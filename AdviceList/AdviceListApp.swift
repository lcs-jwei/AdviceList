//
//  AdviceListApp.swift
//  AdviceList
//
//  Created by Justin Zack Wei on 2023-04-19.
//

import SwiftUI
import Blackbird

@main
struct AdviceListApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                AdviceView()
                    .tabItem{
                        Label("Advice", systemImage: "person.crop.circle.fill.badge.checkmark")
                        
                    }
                AdviceListView()
                    .tabItem{
                        Label("Saved", systemImage: "star.fill")
                    }
            }
            
               .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
