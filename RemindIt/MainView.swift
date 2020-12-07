//
//  ContentView.swift
//  RemindIt
//
//  Created by Manel Muñiz on 21/11/2020.
//

import SwiftUI
import CoreData

struct MainView: View {
    //@State private var selectedTab = 0

    var body: some View {
        
            TabView() {
                AddGeneralView()
                    .tabItem {
                        Image(systemName: "pencil.tip.crop.circle.badge.plus")
                        Text("Add")
                    }
                LearnGeneralView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Learn")
                    }
                
                DecksGeneralView()
                    .tabItem {
                        Image(systemName: "folder.fill")
                        Text("Decks")
                    }
                    
            }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
