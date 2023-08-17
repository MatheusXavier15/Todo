//
//  FormRowStaticView.swift
//  Todo App
//
//  Created by Matheus Xavier on 16/08/23.
//

import SwiftUI

struct FormRowStaticView: View {
    // MARK: - PROPERTIES
    
    let icon: String
    let firstText: String
    let secondText: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            Text(firstText)
                .foregroundColor(.gray)
            Spacer()
            Text(secondText)
        }
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
    }
}
