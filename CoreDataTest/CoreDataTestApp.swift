//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by 노우영 on 2022/04/29.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CoreDataManager())
                
        }
    }
}
