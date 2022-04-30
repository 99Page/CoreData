//
//  MovieDataView.swift
//  CoreDataTest
//
//  Created by 노우영 on 2022/04/30.
//

import SwiftUI

struct MovieDataView: View {
    
    @EnvironmentObject var coreDataManager: CoreDataManager
    @State var isUpdated: Bool = false

    
    var body: some View {
        List {
            ForEach(coreDataManager.movies, id: \.self) { movie in
                NavigationLink {
                    MovieDetail(movie: movie, isUpdated: $isUpdated)
                } label: {
                    Text(movie.title ?? "")
                }
            }.onDelete { indexSet in
                indexSet.forEach { index in
                    let movie = coreDataManager.movies[index]
                    coreDataManager.movies.remove(at: index)
                    coreDataManager.deleteMovies(movie: movie)
                }
            }
        }.onAppear {
            if isUpdated {
                coreDataManager.fetchMovies()
                isUpdated = false
            }
        }
    }
}

struct MovieDataView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDataView()
    }
}
