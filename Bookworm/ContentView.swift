//
//  ContentView.swift
//  Bookworm
//
//  Created by Dilshad P on 01/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books : FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(books){book in
                    NavigationLink {
                        Text(book.title ?? "Unknown Title")
                    } label: {
                        HStack{
                            VStack{
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            EmojiRatingView(rating: book.rating)
                                .font(.headline)
                        }
                    }
                }.onDelete(perform: deleteBook)
                
            }
            .navigationTitle("Add Book")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        showingAddScreen.toggle()
                    }label: {
                        Label("Add Book", image: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen){
                AddBookView()
            }
            
        }
        .padding()
    }
    
    func deleteBook(at offsets:IndexSet){
        for offset in offsets{
            
            let book = books[offset]
            context.delete(book)
        }
        
        try? context.save()
        
    }
}

#Preview {
    ContentView()
}
