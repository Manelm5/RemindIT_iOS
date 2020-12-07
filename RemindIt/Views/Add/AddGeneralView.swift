//
//  AddRemindItem.swift
//  RemindIt
//
//  Created by Manel Muñiz on 22/11/2020.
//

import SwiftUI

struct AddGeneralView: View {
    
    @State private var originalWord: String = ""
    @State private var translatedWord: String = ""
    
    
    @State private var originalLanguageSelection: String = ""
    @State private var translatedLanguageSelection: String = ""
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0
    
    @FetchRequest(
        entity: Language.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Language.name, ascending: false)
        ]
    ) var languagesDB: FetchedResults<Language>
    
    //Referencia a la bd
    @Environment(\.managedObjectContext) var moc

    
    init() {
        UITextView.appearance().backgroundColor = .clear

    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                HStack {
                    SectionCustom(options: languagesDB.map{ ($0.name ?? "") }.sorted{$0 < $1}, selection: $originalLanguageSelection)
                    Image(systemName: "chevron.right")
                        .imageScale(.small)
                    SectionCustom(title: "Deck", icon: "folder", options: languagesDB.map{ ($0.name ?? "") }.sorted{$0 < $1}, selection: $translatedLanguageSelection)
                }
            
                
        
                
                VStack(alignment: .leading) {
                    
                    Text("Write your word here!")
                        .font(.callout)
                        .bold()
                    
                    TextEditor(text: $originalWord)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(6.0)
                    
                    if !translatedWord.isEmpty {
                        Text("Translated word:")
                            .bold()
                        TextEditor(text: $translatedWord)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(6.0)
                        
                    }
                  

                    
                }
                .padding()
              
                
                TranslateButton(original: $originalWord, translated: $translatedWord,
                                    originalLanguage: $originalLanguageSelection,
                                    translatedLanguage: $translatedLanguageSelection)
                
               // AddToDeckButton(translated: $translatedWord)

                if !translatedWord.isEmpty {
                AddToDeckButton(translated: $translatedWord)
                }
                
                
            }
            .navigationBarTitle("Add a new item!", displayMode: .inline)
            .padding(.all)
            .onAppear(perform: {
                fetchLanguages()
            })
        }
    }
    
    func fetchLanguages() {
                
        if(languagesDB.isEmpty) {
            TranslationManager.shared.fetchSupportedLanguages(completion: { (success) in
                
                if (success) {
                    for result in TranslationManager.shared.supportedLanguages {
                        guard (result.code != nil), (result.name != nil) else {
                            break
                        }
                        let newLanguage = Language(context: self.moc)
                        newLanguage.id = UUID()
                        newLanguage.name = result.name
                        newLanguage.code = result.code
                        try? self.moc.save()
                    }
                }
            })
        }
    }
    


}



struct AddGeneralView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddGeneralView()
                .preferredColorScheme(.light)
        }
    }
}

struct TranslateButton: View {
    
    @Binding var original: String
    @Binding var translated: String
    
    @Binding var originalLanguage: String
    @Binding var translatedLanguage: String

    
    
    var body: some View {
        
        Button(action: {initiateTranslation(word: original, originalLanguage: originalLanguage, translateLanguage: translatedLanguage)}, label: {
                HStack {
                    Spacer()
                    Image(systemName: "wand.and.stars.inverse")
                    Text("TRANSLATE")
                        .bold()
                    Spacer()
                }
                
            })
            .padding(.vertical, 20)
            .background(Color.blue)
            .cornerRadius(6.0)
            .foregroundColor(.white)
            .padding(.bottom, 20)
        
        
        
        
    }
    
    func detectLanguage(wordToTranslate: String) {
        
        TranslationManager.shared.detectLanguage(forText: wordToTranslate) { (word) in
            self.translated = word ?? ""
        }
        
    }
    
    func initiateTranslation(word: String, originalLanguage: String, translateLanguage: String) {
        
        TranslationManager.shared.translate(forText: word, originalLanguage: originalLanguage, translateLanguage: translateLanguage) { (traduction) in
            self.translated = traduction ?? ""

        
        }

    }
  
}

struct AddToDeckButton: View {
    
  
    @Binding var translated: String

    var body: some View {
        
        Button(action: {}, label: {
                HStack {
                    Spacer()
                    Image(systemName: "wand.and.stars.inverse")
                    Text("ADD TO DECK")
                        .bold()
                    Spacer()
                }
                
            })
            .padding(.vertical, 20)
            .background(Color.orange)
            .cornerRadius(6.0)
            .foregroundColor(.white)
            .padding(.bottom, 20)
  
        
        
        
    }

}


struct TranslatedWordView: View {
    
    @State var word: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your translated word is...")
                .font(.callout)
                .bold()
            TextField("Translated word:", text: $word)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}






