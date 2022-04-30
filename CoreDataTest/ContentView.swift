//
//  ContentView.swift
//  CoreDataTest
//
//  Created by 노우영 on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var coreDataManager: CoreDataManager
    
    var body: some View {
        NavigationView {
            VStack {
                MovieSaveView()
                MovieDataView()
                Spacer()
            }.padding()
            .navigationTitle("Movies")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CoreDataManager())
    }
}
