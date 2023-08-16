//
//  ContentView.swift
//  Todo App
//
//  Created by Matheus Xavier on 15/08/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var showingAddTodoView: Bool = false

    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(0..<5) { item in
                Text("item: \(item + 1)")
            }
            .navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button {
                        self.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingAddTodoView) {
                        AddTodoView()
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
