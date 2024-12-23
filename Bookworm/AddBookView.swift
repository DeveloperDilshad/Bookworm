//
//  AddBookView.swift
//  Bookworm
//
//  Created by Dilshad P on 01/12/24.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State  private var title = ""
    @State  private var genre = ""
    @State private var author = ""
    @State  private var rating = 3
    @State  private var review = ""
    
    let genres = ["Horror","Romantic","Investigation","THriller","Biography","Comedy"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name of the Book", text: $title)
                    TextField("Name pf Author", text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(genres,id: \.self){
                            Text($0)
                        }
                    }
                    
                }
                Section{
                    TextEditor(text: $review)
                    Picker("Rating", selection: $rating){
                        ForEach(1..<6){
                            Text(String($0))
                        }
                    }
                }header: {
                    Text("Write a review")
                }
                
                Section{
                    Button("Save"){
                        
                        let newBook = Book(context: context)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.review = review
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        
                        
                        try? context.save()
                        dismiss()
                        
                    }
                }
            }.navigationTitle("Add a Book")
        }
    }
}

#Preview {
    AddBookView()
}
