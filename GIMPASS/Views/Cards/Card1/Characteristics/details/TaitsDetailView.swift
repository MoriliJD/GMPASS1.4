//
//  TaitsDetailView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//
import SwiftUI

struct Trait: Identifiable {
    let id = UUID()
    let name: String
    let explanation: String
    let examples: [String]
}

let traits = [
    Trait(name: "Motivation",
          explanation: "Forces that initiate, direct and sustain individual or group behavior in order to satisfy a need or attained goal.",
          examples: [
            "Aspires to be somebody, to do something.",
            "Is an enthusiastic learner.",
            "Demonstrates persistence in pursuing or completing self-selected tasks (may be culturally influenced; evident in school or nonschool activities)."
          ]),
    Trait(name: "Interest",
          explanation: "Activities, avocations, objects, etc. that have special worth or significance and are given special attention.",
          examples: [
            "Demonstrates unusual or advanced interested in a topic or activity.",
            "Is a self-starter.",
            "Is beyond age-group.",
            "Pursues activity unceasingly."
          ]),
    Trait(name: "Communication skills",
          explanation: "Transmission and reception of signals or meanings through a system of symbols (codes, gestures, language, numbers).",
          examples: [
            "Demonstrates unusual ability to communicate (verbally, physically, artistically, or symbolically).",
            "Uses particularly apt examples, illustrations or elaborations."
          ]),
    Trait(name: "Problem-Solving Ability",
          explanation: "Process of determining a correct sequence of alternatives leading to a desired goal or to successful completion or performance of a task.",
          examples: [
            "Demonstrates unusual ability to devise or adapt a systematic strategy for solving problems and to change the strategy if it is not working.",
            "Creates new designs, invents."
          ]),
    Trait(name: "Imagination/Creativity",
          explanation: "Process of forming mental images of objects, qualities, situations, or relationships, which are not immediately apparent to the senses; solve problems by pursuing nontraditional patterns of thinking",
          examples: [
            "Shows exceptional ingenuity using everyday materials.",
            "Creates wild, seemingly silly ideas; often fluently/ flexibly."
          ]),
    Trait(name: "Memory",
          explanation: "Exceptional ability to retain and retrieve information.",
          examples: [
            "Already knows information.",
            "Needs only 1–2 repetitions for mastery.",
            "Has a wealth of information about school or non-school topics.",
            "Pays attention to details.",
            "Manipulates information.",
            "Is highly curious."
          ]),
    Trait(name: "Inquiry",
          explanation: "Method or process of seeking knowledge, understanding, or information",
          examples: [
            "Asks unusual questions for age.",
            "Plays around with ideas.",
            "Demonstrates extensive exploratory behaviors directed toward elicit information about materials, devices or situations."
          ]),
    Trait(name: "Insight",
          explanation: "Sudden discovery of the correct solution following incorrect attempts based primarily on trial and error",
          examples: [
            "Demonstrates exceptional ability to draw inferences.",
            "Appears to be a good guesser.",
            "Keenly observant.",
            "Possesses heightened capacity for seeing unusual and diverse relationships.",
            "Integrates ideas and disciplines."
          ]),
    Trait(name: "Reasoning",
          explanation: "Highly conscious, directed, controlled, active, intentional, forward-looking, goal-oriented thought",
          examples: [
            "Makes generalizations.",
            "Uses metaphors and analogies ... thinks things through in a logical manner.",
            "Thinks crucially ... comes up with plausible answers."
          ]),
    Trait(name: "Humor",
          explanation: "Ability to synthesize key ideas or problems in complex situation in a humorous way; exceptional sense of timing in words and gestures",
          examples: [
            "Has a keen sense of humor, may be gentle/hostile.",
            "See unusual relationships.",
            "Demonstrates unusual emotional depth.",
            "Demonstrates sensory awareness."
          ])
]

struct TaitsDetailView: View {
    @State private var expandedTraitIds: Set<UUID> = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(traits) { trait in
                    Section(header: TraitHeaderView(trait: trait, expanded: expandedTraitIds.contains(trait.id))
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                if expandedTraitIds.contains(trait.id) {
                                    expandedTraitIds.remove(trait.id)
                                } else {
                                    expandedTraitIds.insert(trait.id)
                                }
                            }
                        }
                    ) {
                        if expandedTraitIds.contains(trait.id) {
                            Text(trait.explanation)
                            ForEach(trait.examples, id: \.self) { example in
                                Text("• \(example)")
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Giftedness Traits")
            }
        }
    }
    
    struct TraitHeaderView: View {
        let trait: Trait
        let expanded: Bool
        
        var body: some View {
            HStack {
                Image(systemName: expanded ? "chevron.down" : "chevron.right")
                Text(trait.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    
                    
             
                }

                    
            }
            
        }
    
    struct TaitsDetailView_Previews: PreviewProvider {
        static var previews: some View {
            TaitsDetailView()
        }
    }
}
