//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI


struct CustomComposableView: View {
    
    //MARK: stored properties
   
    
    let message : String
    
    
    // Control the horizontal offset
    @State private var offset = 0.0
    
    @State private var offsety = 75.0
    
    @State var randomColour: Color = .blue
    
    //MARK: control the rotation angle
    
    @State var currentRotationAngle = Angle.degrees(0)
    
    //MARK: control wether or not it is touching the frame
    
    @State var touchingBoarder = false
    
   
    
    let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    var body: some View {
        
//        TextField("enter word", text: message)
        ZStack{
            Circle()
                .opacity(0.0)
            
            
            Text(message)
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
        .onReceive(timer) { input in
            
            //Allow the offset to be changed randomly
            offset = Double.random(in: -85...85)
            offsety = Double.random(in: -150...200)
            //set random colour to be actually randomly selected
            randomColour = Color(hue: Double.random(in: 1...360) / 360.0, saturation: 1, brightness: 1)
        }
     
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "")
    }
}
