//
//  DeckView.swift
//  RemindIt
//
//  Created by Manel Muñiz on 06/12/2020.
//

import SwiftUI

struct DeckView: View {
    
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        
        VStack {
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .topLeading)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Button(action: {}, label: {
                    HStack {
                        Spacer()
                        Image(systemName: "trash")
                    }
                    
                    
                })
                .foregroundColor(.black)
            .padding(.all)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)

                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
         
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(image: "flutter-app", title: "Test", description: "Test description field")
    }
}
