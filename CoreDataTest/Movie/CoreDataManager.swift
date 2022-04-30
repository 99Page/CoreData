//
//  CoreDataManager.swift
//  CoreDataTest
//
//  Created by 노우영 on 2022/04/29.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    
    let persistentContainers: NSPersistentContainer
    @Published var movies: [Movie] = []
    
    init() {
        persistentContainers = NSPersistentContainer(name: "Model")
        persistentContainers.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core data Store failed \(error.localizedDescription)")
            }
        }
        
        fetchMovies()
    }
    
    func fetchMovies() {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            movies = try persistentContainers.viewContext.fetch(fetchRequest)
        } catch {
            movies = []
            print("failed to fetch : \(error.localizedDescription)")
        }
    }
    
    func saveMovies(title: String) {
        
        let movie = Movie(context: persistentContainers.viewContext)
        movie.title = title
        movies.append(movie)
        
        do {
            try persistentContainers.viewContext.save()
        } catch {
            print("Failed to save movie \(error.localizedDescription)")
        }
    }
    
    func deleteMovies(movie: Movie) {
        
        persistentContainers.viewContext.delete(movie)
        
        do {
            try persistentContainers.viewContext.save()
        } catch {
            persistentContainers.viewContext.rollback()
            print("Failed to delete movie \(error.localizedDescription)")
        }
    }
    
    func updateMovie() {
        do {
            try persistentContainers.viewContext.save()
        } catch {
            persistentContainers.viewContext.rollback()
            print("Failed to delete movie \(error.localizedDescription)")
        }
    }
    
}
