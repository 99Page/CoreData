//
//  MovieSaveView.swift
//  CoreDataTest
//
//  Created by 노우영 on 2022/04/30.
//

import SwiftUI

struct MovieSaveView: View {
    
    @State var movieTitle: String = ""
    @EnvironmentObject var coreDataManager: CoreDataManager
    
    var body: some View {
        TextField("Enter title", text: $movieTitle)

        Button {
            print("cliked")
            coreDataManager.saveMovies(title: movieTitle)
            movieTitle = ""
        } label: {
            Text("Save")
        }
    }
}

struct MovieSaveView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSaveView()
    }
}
