//
//  AddTodoView.swift
//  Todo App
//
//  Created by Matheus Xavier on 15/08/23.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                    
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button {
                        if self.name != "" {
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                        } else {
                            self.errorShowing = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to enter something for \nthe new todo item."
                            return
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                }
                .padding(.horizontal)
                .padding(.vertical, 30)
                Spacer()
            }
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
