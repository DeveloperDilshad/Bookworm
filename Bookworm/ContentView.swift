//
//  ContentView.swift
//  Bookworm
//
//  Created by Dilshad P on 01/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var books : FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        VStack {
            NavigationStack{
                Text("Count : \(books.count)")
                    .navigationTitle("Add Book")
                    .toolbar{
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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
