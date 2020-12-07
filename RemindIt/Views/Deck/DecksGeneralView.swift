//
//  PackagesView.swift
//  RemindIt
//
//  Created by Manel Muñiz on 21/11/2020.
//

import SwiftUI


struct DecksGeneralView: View {
    @State var showingDetail = false
    
    @FetchRequest(
        entity: Deck.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Deck.title, ascending: false)
        ]
    ) var decksDB: FetchedResults<Deck>

 
    
    var body: some View {
        
        NavigationView {
            VStack {
           
                if (!decksDB.isEmpty) {
                    ScrollView {
                        LazyVStack {
                            ForEach(decksDB, id: \.self) { (deck: Deck) in
                                Button(action: {
                                    
                                    print("Button clicked:" + deck.title! )
                                    
                                }) {
                                    
                                    DeckView(image: "flutter-app", title: deck.title ?? "", description: deck.descrip ?? "")
                                    
                                }
                            }
                        }
                    }
                } else {
                    Text("There are no cards. Create one!")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle(Text("Decks"))
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: NewDeckView() ,
                                        label: {
                                            Button(action: {
                                                self.showingDetail.toggle()
                                            }) {
                                                Image(systemName: "plus.circle.fill")
                                                    .imageScale(.large)
                                            }.sheet(isPresented: $showingDetail) {
                                                NewDeckView()
                                            }
                                        })
            )
        }
    }
    
    func checkIfAreDecks() {
        
    }

}

struct DecksGeneralView_Previews: PreviewProvider {
    static var previews: some View {
        DecksGeneralView()
    }
}
