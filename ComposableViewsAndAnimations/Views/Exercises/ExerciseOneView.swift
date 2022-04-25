//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    @State private var scaleFactor: CGFloat = 1.0
    
    @State private var scaleFactor1: CGFloat = 0.5
    
    @State private var hue: Color = .red
    
//    Int randomCount: 1...100
    // MARK: Computed properties
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Circle()
                    .scaleEffect(scaleFactor)
                //Set colour as the basic red colour
                    .foregroundColor(hue)
                // when tapped do the following...
                    .onTapGesture {
                        // if the circle is great that 0.1 allow its size to be decreased
                        
                        if  scaleFactor > 0.99{
                            
                            scaleFactor -= Double.random(in: 0.2...0.5)
                        } else {
                            scaleFactor = 1.0
                            
                            hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                        saturation: 0.8,
                                        brightness: 0.8)
                            
                        }
                        
                    }
                // Would like to know if I can make the repeat count random.
                    .animation(useAnimation ? .interpolatingSpring(stiffness: 10, damping: 1).repeatCount(Int(Double.random (in: 1...3))) : .none)
            }
            VStack{
           
                Circle()
                .scaleEffect(scaleFactor1)
            //Set colour as the basic red colour
                .foregroundColor(hue)
            // when tapped do the following...
                .onTapGesture {
                    // if the circle is great that 0.1 allow its size to be decreased
                    
                    if  scaleFactor1 > 0.99{
                        
                        scaleFactor1 -= Double.random(in: 0.2...0.5)
                    } else {
                        scaleFactor1 = 1.0
                        
                        hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                    saturation: 0.8,
                                    brightness: 0.8)
                        
                    }
                    
                }
            // Would like to know if I can make the repeat count random.
                .animation(useAnimation ? .interpolatingSpring(stiffness: 10, damping: 1).repeatCount(Int(Double.random (in: 1...3))) : .none)
                
            }
                
                
            .navigationTitle("Exercise 1")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }
            
        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseOneView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOneView(showThisView: .constant(true))
    }
}
