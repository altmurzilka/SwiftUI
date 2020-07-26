//
//  ContentView.swift
//  ConcurrencyTest
//
//  Created by Алтын on 7/22/20.
//

import SwiftUI
import SwiftyJSON

//func someFunc() {
//    let configuration = URLSessionConfiguration.default
//    let session = URLSession(configuration: configuration)
//
//    guard let url = URL(string: "http://www.jservice.io/api/random") else {
//    fatalError()
//    }
//
//    let task = session.dataTask(with: url) {
//        data, response, error in
//        guard let httpResponse = response as? HTTPURLResponse,
//              (200..<300).contains(httpResponse.statusCode) else {
//            return
//        }
//        guard let data = data else {
//            return
//        }
//        if let result = String(data: data, encoding: .utf8) {
//            print(result)
//        }
//    }
//    task.resume()
//}

struct ContentView: View {
    
    @ObservedObject var list = getData()
    
    var body: some View {
        NavigationView {
            List(list.datas) { i in
                    HStack(spacing: 15) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(i.question).fontWeight(.heavy)
                            Text(i.answer).lineLimit(2)
                        }
                    }.padding(.vertical, 15)
            }.navigationBarTitle("Headlines")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct dataType: Identifiable {
    var id : Int
    var answer : String
    var question : String
    var value : Int
}

class getData: ObservableObject {
    @Published var datas = [dataType]()
    
    init() {
        let sourse = "http://www.jservice.io/api/random"
        
        let url = URL(string: sourse)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            
            for i in json["answer"] {
                let id = i.1["publishedAt"].stringValue
                let answer = i.1["answer"].stringValue
                let question = i.1["question"].stringValue
                let value = i.1["value"].stringValue
                
                DispatchQueue.main.async {
                    self.datas.append(dataType(id: id, answer: answer, question: question, value: value))
                }
            }
        }.resume()
    }
}



