//
//  AdviceView.swift
//  AdviceList
//
//  Created by Justin Zack Wei on 2023-04-21.
//

import SwiftUI
import Blackbird

struct AdviceView: View {
    
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @State var adviceOpacity = 0.0
    @State var currentAdvice: Advice?
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "sun.max.fill")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .foregroundColor(.yellow)
                Spacer()
                if let currentAdvice = currentAdvice{
                    
                    
                                    
                    Text(currentAdvice.advice)
                        .font(.system(size: 40))
                        .padding(50)
                        .opacity(adviceOpacity)
                    Spacer()
                                    
                      
                    
                    .disabled(adviceOpacity == 0.0 ? true : false)
                    .buttonStyle(.borderedProminent)
                    
                    
                }else {
                    ProgressView()
                    Spacer()
                }
                Button(action: {
                    // Reset the interface
                    currentAdvice = nil

                    Task {
                        // Get another joke
                        withAnimation {
                            adviceOpacity = 1
                        }
                        currentAdvice = await NetworkService.fetch()
                    }
                }, label: {
                    Text("Generate Some Advice")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    Task{
                        if let currentAdvice = currentAdvice{
                            try await db!.transaction { core in
                                try core.query("INSERT INTO Advice (advice, id) VALUES (?, ?)",
                                               currentAdvice.advice,
                                               currentAdvice.id)
                            }
                        }
                    }
                           
                       }) {
                           Text("Save Advice")
                               .font(.caption)
                               .bold()
                               .padding()
                               .foregroundColor(.white)
                               .background(Color.green)
                               .cornerRadius(10)
                       }

                
            }
           
                .navigationTitle("Random Advice")
                .task{
                    currentAdvice = await NetworkService.fetch()
        }
        
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
