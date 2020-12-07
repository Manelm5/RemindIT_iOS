//
//  LearnView.swift
//  RemindIt
//
//  Created by Manel Muñiz on 21/11/2020.
//

import SwiftUI


struct LearnGeneralView: View {
    
    var sectionChoices = ["Mild", "Medium", "Mature"]
    @State private var selectedSectionChoice = 0
    
    var deckChoices = ["Mild", "Medium", "Mature"]
    @State private var selectedDeckChoice = 0
    
    var learningChoices = ["Mild", "Medium", "Mature"]
    @State private var learningModeChoice = 0
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Form {
                    //SectionFormView(selected: selectedSectionChoice, choices: sectionChoices)
                    //DeckFormView(selected: selectedDeckChoice, choices: deckChoices)
                    //LearningModeFormView(selected: learningModeChoice, choices: learningChoices)
                    VStack {
                        Text("¿ Are you ready... ?")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .foregroundColor(.gray)
                    .font(.title2)
                }
                
                .background(Color(UIColor.systemBackground))
                .padding(.all)
                .navigationTitle(Text("Time to learn"))
                .navigationBarItems(trailing:
                                        NavigationLink(
                                            destination: SettingsView(),
                                            label: {
                                                Image(systemName: "gear")
                                                    .imageScale(.large)
                                            })
                )
                
                VStack {
                    Spacer()
                    PlayButton()
                }
            }
            
        }
        
        
    }
}

struct PlayButton: View {
    
    @State var color  = 1
    
    var body: some View {
        Button(action: {}, label: {
            HStack {
                Spacer()
                Image(systemName: "play.circle.fill")
                Text("PLAY")
                    .bold()
                Spacer()
            }
            
        })
        .padding(.vertical, 20)
        .background(changeBkColor(color: color))
        .cornerRadius(6.0)
        .foregroundColor(.white)
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
    }
}

func changeBkColor(color: Int) -> Color
{
    if(color == 0)
    {
        return Color.red;
    }
    else if(color == 1)
    {
        return Color.green;
    }
    else
    {
        return Color.blue;
    }
}


struct LearnGeneralView_Previews: PreviewProvider {
    static var previews: some View {
        LearnGeneralView()
    }
}

struct SectionFormView: View {
    
    @State var selected: Int
    var choices: [String]
    
    var body: some View {
        
        Section {
            HStack(spacing: 10) {
                Image(systemName: "tray.2")
                Text("Please, select a section:")
                    .bold()
            }
            .font(.title3)
            Picker(selection: $selected, label: Text("Section")) {
                ForEach(0 ..< choices.count) {
                    Text(self.choices[$0])
                    
                }
            }
        }
    }
}

struct DeckFormView: View {
    
    @State var selected: Int
    var choices: [String]
    
    var body: some View {
        
        Section {
            HStack(spacing: 10) {
                Image(systemName: "folder")
                Text("Please, select the desired deck:")
                    .bold()
            }
            .font(.title3)
            Picker(selection: $selected, label: Text("Deck")) {
                ForEach(0 ..< choices.count) {
                    Text(self.choices[$0])
                    
                }
            }
        }
    }
}


struct LearningModeFormView: View {
    
    @State var selected: Int
    var choices: [String]
    
    var body: some View {
        
        Section {
            HStack(spacing: 10) {
                Image(systemName: "pencil.tip.crop.circle")
                Text("Time to select the learning mode!")
                    .bold()
            }
            .font(.title3)
            Picker(selection: $selected, label: Text("Learning Mode")) {
                ForEach(0 ..< choices.count) {
                    Text(self.choices[$0])
                    
                }
            }
        }
    }
}
