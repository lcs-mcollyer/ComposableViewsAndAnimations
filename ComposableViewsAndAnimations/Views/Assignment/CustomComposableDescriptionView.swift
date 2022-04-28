//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Transitional Screen")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    This view allows the user to utilize user input into a loading or transialtion screen.
                    
                    The way in wich i see this best utilized is through usernames.
                    
                    I believe that if the app reaquires a user to log in, that this would be a fantasitc transition screen into the app.
                    """)
                
                TextField("Enter Username...", text: $phrase)
                
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView(message: phrase)) {
                    SimpleListItemView(title: "My Composable View",
                                       caption: "A brief description of my view")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
