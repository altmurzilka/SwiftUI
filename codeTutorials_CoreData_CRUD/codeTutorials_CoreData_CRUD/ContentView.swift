//
//  ContentView.swift
//  codeTutorials_CoreData_CRUD
//
//  Created by Алтын on 9/21/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var cards:[NSManagedObject] = []
    @State var text: String = ""
    
    var body: some View {
        VStack {
            VStack {
                TextField("lol", text: $text)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(5)
                Button(action: {}) {
                    Text("Button")
                }
            }.padding()
            .background(Color.init(white: 0.9))
            .cornerRadius(10)
            .padding()
            
            ForEach(cards, id: \.self) { word in
                
            }
        }
    }
    
    
    func addNewCard(){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Card",
                                       in: managedContext)!
        
        let newCard = NSManagedObject(entity: entity,
                                        insertInto: managedContext)
        
        newCard.setValue($text.wrappedValue, forKeyPath: "word")
        
        do {
            try managedContext.save()
            print("saved successfully -- \($text.wrappedValue)")
            self.loadCard()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    //Read
    func loadCard(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Card")
        
        do {
            cards = try managedContext.fetch(fetchRequest)
            self.showSheet = false
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
