//
//  EmptyListView.swift
//  Todo App
//
//  Created by Matheus Xavier on 16/08/23.
//

import SwiftUI

struct EmptyListView: View {
    // MARK: - PROPERTIES
    
    @State private var isAnimated: Bool = false
    let imageNumber: Int = Int.random(in: 1...3)
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Image("illustration-no\(imageNumber)")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                Text("Use your time wisely.")
                    .font(.system(.headline, design: .rounded))
                    .layoutPriority(0.5)
            }
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0)
            .offset(y: isAnimated ? 0 : -50)
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    self.isAnimated = true
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .ignoresSafeArea(.all)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
