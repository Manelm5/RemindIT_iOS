//
//  SettingsView.swift
//  RemindIt
//
//  Created by Manel Muñiz on 21/11/2020.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
       
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Image(systemName: "gear")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 60, height: 60)
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text("Welcome to the RemindIt settings")
                        .foregroundColor(.gray)
                        .font(.system(size: 18))
                        .lineLimit(nil)
                    Text("Set up language, set as pro user and more...")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .lineLimit(nil)
                    
                    
                }
            }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
