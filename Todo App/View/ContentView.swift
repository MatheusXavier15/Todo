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
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @State private var showingSettingsView: Bool = false
    @State private var showingAddTodoView: Bool = false
    @State private var isAnimatedButton: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(self.todos, id: \.self) { todo in
                        HStack {
                            Text(todo.name ?? "Unknown")
                            Spacer()
                            Text(todo.priority ?? "Unknown")
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button {
                            self.showingSettingsView.toggle()
                        } label: {
                            Image(systemName: "gear")
                        }
                    })
                }
                
                if todos.count == 0 {
                    EmptyListView()
                }
            }
            .sheet(isPresented: $showingSettingsView) {
                SettingsView().environment(\.managedObjectContext, self.managedObjectContext)
            }
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
            }
            .overlay (
                ZStack {
                    Group {
                        Circle()
                            .fill(.blue)
                            .opacity(self.isAnimatedButton ? 0.2 : 0)
                            .scaleEffect(self.isAnimatedButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(.blue)
                            .opacity(self.isAnimatedButton ? 0.15 : 0)
                            .scaleEffect(self.isAnimatedButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    Button {
                        self.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                self.isAnimatedButton.toggle()
                            }
                        }
                    }
                }
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
        }
    }
    
    // MARK: - FUNCTIONS
    
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
