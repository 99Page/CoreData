//
//  MovieDetail.swift
//  CoreDataTest
//
//  Created by 노우영 on 2022/04/30.
//

import SwiftUI

struct MovieDetail: View {
    
    let movie: Movie
    
    @State private var movieName: String = ""
    @Binding var isUpdated: Bool
    
    @EnvironmentObject var coreDataManager: CoreDataManager
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
            Button {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDataManager.updateMovie()
                    isUpdated.toggle()
                }
            } label: {
                Text("Update")
            }

        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), isUpdated: .constant(false))
    }
}
