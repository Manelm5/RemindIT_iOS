//
//  NewDeckView.swift
//  RemindIt
//
//  Created by Manel Muñiz on 22/11/2020.
//

import SwiftUI

struct NewDeckView: View {
    
    @State var title: String = ""
    @State var description: String = ""
    @State private var bgColor = Color.white
    
    
    @State var selectedTags : Set<String> = []
    private var orderedSelectedTags: [String] { selectedTags.sorted() }

    @State var tagText: String = ""
    
    @Environment(\.presentationMode) var presentationMode

    //Referencia a la bd
    @Environment(\.managedObjectContext) var moc
   
    var body: some View {
        NavigationView {
            VStack {
                
                //Set title and description
                VStack {
                    TextField("Title", text: $title)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                    
                    TextField("Description", text: $description)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                }.padding(.all)
                
               
                
                //Set background colour deck
                HStack {
                    Image(systemName: "paintbrush.fill")
                        .colorInvert()
                        .padding()
                    ColorPicker("Set the background color", selection: $bgColor)
                        .padding()
                        .foregroundColor(.blue)
                
                }
                .background(Color.white)
                .cornerRadius(6)
                .padding(.all)
                
                
                TextField("Add a tag...", text: $tagText)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                    .padding(.all)
                
                Button(action: {selectedTags.insert(tagText)}, label: {
                        HStack {
                            Text("ADD TAG")
                                .bold()
                        }.padding(.horizontal,10)
                        .padding(.vertical, 10)
                            
                    })
                    .background(Color.blue)
                    .cornerRadius(6.0)
                    .foregroundColor(.white)
          

                
                //Scrolling tags
                ScrollView(.vertical, showsIndicators: true) {
                    HStack {
                        Spacer()
                        VStack{
                            ForEach(orderedSelectedTags, id: \.self){tag in
                                Button(action: {}) {
                                    HStack {
                                        Text(tag)
                                        Button(action: {selectedTags.remove(tag)}, label: {
                                            Image(systemName: "xmark.circle")
                                            })
                                        
                                    }
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.orange)
                                .cornerRadius(6)
                                .lineLimit(1)
                            }
                        }
                        Spacer()
                    }
                        
                }
                .cornerRadius(6)
                .padding()
                    
                Spacer()
                
                

            
            }
            .foregroundColor(.white)
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarTitle("New deck", displayMode: .inline)
            .navigationBarItems(trailing:
                            Button("Añadir") {
                                self.presentationMode.wrappedValue.dismiss()
                                addDeck()
                            }
                        )

        }
    }
    
    
    func addDeck() {
        //Here we are going to add the deck to the database
        let newDeck = Deck(context: self.moc)
        newDeck.id = UUID()
        newDeck.title = self.title
        newDeck.descrip = self.description
        try? self.moc.save()
    }

 
}

struct NewDeckView_Previews: PreviewProvider {
    static var previews: some View {
        NewDeckView()
    }
}
