//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI


struct CustomComposableView: View {
    
    //MARK: stored properties
    
    // Control the horizontal offset
    @State private var offset = 0.0
    
    @State private var offsety = 75.0
    
    @State var randomColour: Color = .blue
    
    //MARK: control the rotation angle
    
    @State var currentRotationAngle = Angle.degrees(0)
    
    //MARK: control wether or not it is touching the frame
    
    @State var touchingBoarder = false
    
    var body: some View {
        
        ZStack{
            Circle()
                .opacity(0.0)
            
            
            Text("CLICK ME")
                .foregroundColor(randomColour)
                .font(.largeTitle)
                .bold()
                .shadow(color: .black, radius: 1.5, x: 0, y: 0)
        }
        
        
        // Rotate the cirlce around the centre with the rotation angle
        .rotationEffect(currentRotationAngle, anchor: .center)
        .offset(x: offset, y: offsety)
        
        // Animate the movement/ofset
        .animation(.interpolatingSpring(stiffness: 10, damping: 4))
     
        
        // try to get this to run when it hits the boarder of the phone.
        // MARK: Once tapped
        .onTapGesture {
            
            //Allow the offset to be changed randomly
            offset = Double.random(in: -99...99)
            offsety = Double.random(in: -99...99)
            //set random colour to be actually randomly selected
            randomColour = Color(hue: Double.random(in: 1...360) / 360.0, saturation: 1, brightness: 1)
        }
        
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
