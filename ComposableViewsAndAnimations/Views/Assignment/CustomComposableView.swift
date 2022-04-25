//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI


struct CustomComposableView: View {
 
//MARK: stored properties
   
    // control the horizontal offset
    @State private var offset = 0.0
    
    
    
    
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50, height: 50)
            
            Text("OK")
                .foregroundColor(.white)
        }
        .offset(x: offset, y: 0)
        .animation(.default)
        .onTapGesture {
            offset = Double.random(in: 5...95)
        }
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
