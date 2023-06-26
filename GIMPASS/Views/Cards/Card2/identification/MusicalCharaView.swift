//
//  MusicalCharaView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//
import SwiftUI

struct MusicalCharaView: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 7)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. Shows a sustained interest in music – seeks out opportunities to hear and create music.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. Perceives fine differences in musical tone (pitch, loudness, timbre, duration).", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. Easily remembers melodies and can produce them accurately.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. Eagerly participates in musical activities.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. Plays a musical instrument (or indicates a strong desire to).", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. Is sensitive to the rhythm of music; responds to changes in the tempo of music through body movements.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. Is aware of and can identify a variety of sounds heard at a given moment – is sensitive to “background” noises, to chords that accompany a melody, to the different sounds of singers or instrumentalists in a performance.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
        ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Leave space for pictures
                    Image("your_image")
                        .resizable()
                        .scaledToFit()
                
                    
                    ForEach(0..<questions.count) { index in
                        QuestionView(questionText: questions[index].0, answerOptions: questions[index].1, selectedIndex: $selectedAnswers[index])
                    }
                    
                    Button("Submit") {
                        calculateResults()
                        showResults = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                .background(Color.white)
                .navigationTitle("Musical Characteristics")
                .fullScreenCover(isPresented: $showResults) {
                    ResultView(resultRange: resultRange, restart: restartScreening)
                }
            }
        }
    }

    func calculateResults() {
        let totalScore = selectedAnswers.reduce(0, { x, y in x + (y + 1) })
        let evenScore = totalScore / questions.count
        resultRange = (evenScore <= 3) ? 1 : 2
    }

    func restartScreening() {
        selectedAnswers = Array(repeating: 0, count: questions.count)
        showResults = false
    }
}

struct Question6View: View {
    let questionText: String
    let answerOptions: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(questionText)
                .font(.headline)
            
            Picker("Frequency", selection: $selectedIndex) {
                ForEach(0..<answerOptions.count) { index in
                    Text(answerOptions[index]).tag(index)
                }
            }
            .pickerStyle(.navigationLink)
        }
        .padding(.bottom)
    }
}

struct Result6View: View {
    let resultRange: Int
    let restart: () -> Void
    @State private var showShareSheet = false

    var body: some View {
        VStack {
            if resultRange == 1 {
                // Content for result range 1 to 3
                Text("Explanation for range 1 to 3")
            } else {
                // Content for result range above 4
                Text("Explanation for range above 4")
            }
            
            Button("Restart Screening") {
                restart()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button("Save Screenshot") {
                showShareSheet = true
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            .sheet(isPresented: $showShareSheet) {
                shareSheet
            }
        }
        .padding()
        .background(Color.white)
    }
    
    var shareSheet: some View {
        let image = UIApplication.shared.windows[0].rootViewController?.view.asImage()
        
        return ShareSheet(activityItems: [image ?? UIImage()])
    }
}

extension UIView {
    func asImage6() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share6Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share6Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share6Sheet>) {
       
    }
}

struct MusicalCharaView_Previews: PreviewProvider {
    static var previews: some View {
        MusicalCharaView()
    }
}
