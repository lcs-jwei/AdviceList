//
//  AdviceListView.swift
//  AdviceList
//
//  Created by Justin Zack Wei on 2023-04-19.
//

import Blackbird
import SwiftUI

struct AdviceListView: View {
    
    @BlackbirdLiveModels({ db in
        try await Advice.read(from: db)
    }) var adviceList
    
    var body: some View {
        
        NavigationView{
            List(adviceList.results) {currentAdvice in
                VStack(alignment: .leading) {
                    Text(currentAdvice.advice)
                        .bold()
                }
            }
        }
    }
}
struct AdviceListView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceListView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
