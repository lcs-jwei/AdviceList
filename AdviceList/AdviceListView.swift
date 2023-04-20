//
//  AdviceListView.swift
//  AdviceList
//
//  Created by Justin Zack Wei on 2023-04-19.
//

import SwiftUI

struct AdviceListView: View {
    @State var adviceOpacity = 0.0
    @State var currentAdvice: Advice?
    var body: some View {
        NavigationView{
            VStack{
                if let currentAdvice = currentAdvice{
                    Image(systemName: "sun.max.fill")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .foregroundColor(.yellow)
                                    
                    Text(currentAdvice.advice)
                        .font(.system(size: 30))
                        .padding(50)
                        .opacity(adviceOpacity)
                                    
                      
                    Button(action: {
                        // Reset the interface
                        adviceOpacity = 0.0

                        Task {
                            // Get another joke
                            withAnimation {
                                currentAdvice = nil
                            }
                            currentAdvice = await NetworkService.fetch()
                        }
                    }, label: {
                        Text("Fetch another one")
                    })
                    .disabled(adviceOpacity == 0.0 ? true : false)
                    .buttonStyle(.borderedProminent)
                    /*
                    Button(action: {
                        withAnimation(.easeIn(duration: 1.0)){
                            adviceOpacity = 1.0
                        }
                               
                           }) {
                               Text("Generate Some Advice")
                                   .font(.headline)
                                   .padding()
                                   .foregroundColor(.white)
                                   .background(Color.blue)
                                   .cornerRadius(10)
                           }*/
                    Button(action: {
                               
                           }) {
                               Text("Save Advice")
                                   .font(.caption)
                                   .bold()
                                   .padding()
                                   .foregroundColor(.white)
                                   .background(Color.green)
                                   .cornerRadius(10)
                           }
                }else {
                    ProgressView()
                }

                
            }
           
                .navigationTitle("Random Advice")
        }
        .task{
            currentAdvice = await NetworkService.fetch()
        }
    }
}
struct AdviceListView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceListView()
    }
}
