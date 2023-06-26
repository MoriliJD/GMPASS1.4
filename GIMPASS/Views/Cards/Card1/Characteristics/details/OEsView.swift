//
//  OEsView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//
import SwiftUI

struct Overexcitability: Identifiable {
    let id = UUID()
    let name: String
    let explanation: String
    let intro :String
    let examples: [String]
}

let overexcitabilities = [
    Overexcitability(name: "Psychomotor",
                      explanation: "Gifted children frequently have psychomotor OE. It is distinguished largely by a high amount of energy. Children with this OE appear to be on the move all the time. They require less sleep than normal youngsters even as infants. They can work long hours as adults without becoming tired.",
                     intro: "The primary manifestation of this intensity is an abundance of energy. Children with a dominant psychomotor OE may exhibit the following characteristics:",
                      examples: ["Competitiveness","Compulsive organizing","Compulsive talking","Impulsive behavior","Physical expression of emotions","Preference for fast action and sports","Nervous habits and tics","Rapid speech","Sleeplessness"
                        ]),
    Overexcitability(name: "Sensual",
                      explanation: "Gifted individuals with sensual overexcitability may have a heightened sensitivity to their surroundings. They may be more aware of sounds, smells, tastes, textures, and visual stimuli than others.",
                     intro: "Characteristics of children with a dominant Sensual OE may include:",
                      examples: ["Appreciation of beauty, whether in writing, music, art or nature, including the love of objects like jewelry","Craving for pleasure","Need or desire for comfort","Sensitivity to pollution","Sensitive to smells, tastes, or textures of foods","Tactile sensitivity (bothered by the feel of some materials on the skin or clothing tags)"
                        ]),
    Overexcitability(name: "Intellectual",
                      explanation: "This is the most noticeable intensity among gifted children. It is distinguished by mental activities. Children who lead with such zeal appear to be always thinking and seeking answers to serious concerns. When their asking of the teacher appears to be disrespectful and confrontational, their need for answers can land kids in problems at school. ",
                     intro: "They may exhibit several of these traits:",
                      examples: ["Analytical thinking","Asking probing questions","Avid reading","Concentration, ability to maintain intellectual effort","Deep curiosity","Independent thinking","Love of knowledge and learning","Love of problem-solving","Theoretical thinking"
                                 ]),
    Overexcitability(name: "Imaginational",
                      explanation: "Gifted individuals with imaginational overexcitability may have a rich inner life and a vivid imagination. They may enjoy daydreaming, creating stories, and exploring alternate realities.",
                     intro: "an Imaginational OE child may exhibits:",
                      examples: ["Daydreaming","Detailed visualization","Fear of the unknown","Good sense of humor","Imaginary friends","Love of fantasy","Love of poetry, music, and drama","Magical thinking","Vivid dreams"
                                 ]),
    Overexcitability(name: "Emotional",
                      explanation: "Gifted individuals with emotional overexcitability may have intense feelings and a heightened sensitivity to their own emotions and the emotions of others. They may be deeply empathetic and compassionate.",
                     intro: " an Emotional OE child may exhibits:",
                      examples: ["Anxiety","Concern for others","Depression","Extremes of emotion","Feelings of guilt and sense of responsibility","Feelings of inadequacy and inferiority","A heightened sense of right and wrong or injustice and hypocrisy","Loneliness","Need for security","Physical response to emotions (stomach aches caused by anxiety, for example)","Problems adjusting to change","Strong memory of feelings", "Timidity and shyness"])
]

struct OEsView: View {
    @State private var expandedOverexcitabilityIds: Set<UUID> = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(overexcitabilities) { overexcitability in
                    Section(header:
                        Button(action: {
                            withAnimation(.easeInOut) {
                                if expandedOverexcitabilityIds.contains(overexcitability.id) {
                                    expandedOverexcitabilityIds.remove(overexcitability.id)
                                } else {
                                    expandedOverexcitabilityIds.insert(overexcitability.id)
                                }
                            }
                        }) {
                            OverexcitabilityHeaderView(overexcitability: overexcitability, expanded: expandedOverexcitabilityIds.contains(overexcitability.id))
                        }
                        .buttonStyle(PlainButtonStyle())
                    ) {
                        if expandedOverexcitabilityIds.contains(overexcitability.id) {
                            Text(overexcitability.explanation)
                            Text(overexcitability.intro)
                            ForEach(overexcitability.examples, id: \.self) { example in
                                Text("• \(example)")
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Overexcitabilities")
        }
    }
}

struct OverexcitabilityHeaderView: View {
    let overexcitability: Overexcitability
    let expanded: Bool
    
    var body: some View {
        HStack {
            Image(systemName: expanded ? "chevron.down" : "chevron.right")
            Text(overexcitability.name)
                .font(.body)
                .fontWeight(.bold)
                
        }
        .padding()
    }
}
struct OEsView_Previews: PreviewProvider {
    static var previews: some View {
        OEsView()
    }
}
