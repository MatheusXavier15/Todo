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
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Todo", text: $name)
                    
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button {
                        print("Save")
                    } label: {
                        Text("Save")
                    }

                }
                Spacer()
            }
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
