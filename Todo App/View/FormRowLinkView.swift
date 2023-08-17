//
//  FormRowLinkView.swift
//  Todo App
//
//  Created by Matheus Xavier on 16/08/23.
//

import SwiftUI

struct FormRowLinkView: View {
    // MARK: - PROPERTIES
    
    let icon: String
    let color: Color
    let text: String
    let link: String

    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            .frame(width: 36, height: 36, alignment: .center)
            Text(text)
                .foregroundColor(.gray)
            Spacer()
            Button {
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else { return }
                UIApplication.shared.open(url as URL)
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .tint(Color(.systemGray2))
        }
    }
}

struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "www.google.com")
            .padding()
    }
}
