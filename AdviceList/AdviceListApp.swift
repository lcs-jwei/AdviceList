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
            AdviceListView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
