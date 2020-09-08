//
//  CoreDataManagers.swift
//  BlogApp
//
//  Created by Алтын on 9/8/20.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc : NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func savePost(post: Post) throws {
        self.moc.insert(post)
        try save()
    }
    
    private func save() throws {
        try self.moc.save()
    }
    
    func getAllPosts() -> [Post] {
        
        var posts = [Post]()
        
        let request: NSFetchRequest<Post> = Post.fetchRequest()
        
        do {
            posts = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return posts
    }
    
}
