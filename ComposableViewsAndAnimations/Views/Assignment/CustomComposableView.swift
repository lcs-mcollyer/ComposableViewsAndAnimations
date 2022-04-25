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
    @State private var offsety = 50.0
    
    //MARK: control the rotation angle
    @State var currentRotationAngle = Angle.degrees(0)
    
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50, height: 50)
            
            Text("OK")
                .foregroundColor(.white)
        }
        .rotationEffect(currentRotationAngle, anchor: .center)
        .offset(x: offset, y: offsety)
       
      
       
        .animation(Animation.easeInOut(duration: 1.0))
       
        
        
        // Once tapped
        .onTapGesture {
          
            // Rotate a full rotation
            currentRotationAngle += .degrees(360)
            
            //Allow the offset to be changed randomly
            offset = Double.random(in: 5...95)
            offsety = Double.random(in: 20...80)
        
           
        }
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
