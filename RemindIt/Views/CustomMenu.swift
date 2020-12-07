//
//  CustomMenu.swift
//  RemindIt
//
//  Created by Manel Muñiz on 23/11/2020.
//

import SwiftUI
import CoreData


struct CustomMenu: View {
    var strengths = ["Mild", "Medium", "Mature"]
    @State var selection = ""
    
    @State private var selectedStrength = 0
  
    
    var body: some View {
        NavigationView {
            VStack {
                SectionCustom(title: "Hola", icon: "folder", options: strengths, selection: $selection)
            }
            .padding(.horizontal, 10)
        }
    }
}


struct SectionCustom: View {
    var title: String?
    var icon: String?
    var options: [String]
    @Binding var selection: String

    
    var body: some View {
        NavigationLink(destination: SectionSelector(selection: $selection, options: options)) {
            HStack {
                //Image(systemName: icon)
                //Text(title)
                Text(selection.isEmpty ? "Sin seleccionar" : selection)
            
            }
            .padding()
            .foregroundColor(.white)
            .background(Color(UIColor.systemBlue))
            .cornerRadius(10)
            .contentShape(Rectangle())
        }
    }
}

struct SectionSelector: View {

    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selection: String
    
    @State var text: String = ""
    @State private var isEditing = false
   
    var options:[String]
    
    var body: some View {
        ScrollView {
            VStack {

                ForEach(options, id: \.self) { option in
                    HStack {
                        
                        
                        if option.contains(text) || text == "" {
                            Text("\(option)")
                        }

                        Spacer()
                        if option == selection {
                            //Text(Image(systemName: "checkmark"))
                            //    .bold()
                            //    .foregroundColor(.accentColor)
                        }
                    }
                    .padding()
                    .contentShape(Rectangle())
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .onTapGesture {
                        selection = option
                        self.presentationMode.wrappedValue.dismiss()
                    }
                
                }
                 
 
                Spacer()
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarTitle(Text(""), displayMode: .inline)
        }

    }
}

struct CustomMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomMenu().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
