//
//  ContentView.swift
//  TinyToyTank
//
//  Created by Bennett Dixon on 7/13/22.
//

import SwiftUI
import Combine
import RealityKit

private let BUTTON_SIZE: CGFloat = 60

enum TankAction: String {
    case tankLeft, tankRight, tankForward, turretLeft, turretRight, turretFire
}

class ActionDelegate: ObservableObject {
    static var shared: ActionDelegate = ActionDelegate()
    @Published var arView: ARView!
    @Published var isActionPlaying: Bool = false
    
    func handleTankForwardPressed() {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankForward.post()
        }
    }
    
    func handleTankLeftPressed() {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankLeft.post()
        }
    }
    
    func handleTankRightPressed() {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankRight.post()
        }
    }
    
    func handleFireTurretPressed() {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.cannonFire.post()
        }
    }
    
    func handleTurretRightPressed() {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.turretRight.post()
        }
    }
    
    func handleTurretLeftPressed() {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.turretLeft.post()
        }
    }
    
    init() {
        arView = ARView(frame: .zero)
        let tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor.cannon?.setParent(tankAnchor.tank, preservingWorldTransform: true)
        tankAnchor.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }
        arView.scene.anchors.append(tankAnchor)
    }
}

struct ContentView : View {
    @ObservedObject var delegate: ActionDelegate = ActionDelegate.shared
    
    var body: some View {
        ZStack {
            ARViewContainer()
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    Button(action: delegate.handleTurretLeftPressed, label: {
                        Image("TurretLeft")
                            .resizable()
                            .scaledToFit()
                            .frame(width: BUTTON_SIZE, height: BUTTON_SIZE)
                    })
                    Button(action: delegate.handleFireTurretPressed, label: {
                        Image("CannonFire")
                            .resizable()
                            .scaledToFit()
                            .frame(width: BUTTON_SIZE, height: BUTTON_SIZE)
                    })
                    Button(action: delegate.handleTurretRightPressed, label: {
                        Image("TurretRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: BUTTON_SIZE, height: BUTTON_SIZE)
                    })
                }
                HStack(spacing: 10) {
                    Button(action: delegate.handleTankLeftPressed, label: {
                        Image("TankLeft")
                            .resizable()
                            .scaledToFit()
                            .frame(width: BUTTON_SIZE, height: BUTTON_SIZE)
                    })
                    Button(action: delegate.handleTankForwardPressed, label: {
                        Image("TankForward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: BUTTON_SIZE, height: BUTTON_SIZE)
                    })
                    Button(action: delegate.handleTankRightPressed, label: {
                        Image("TankRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: BUTTON_SIZE, height: BUTTON_SIZE)
                    })
                }
            }
            .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 40)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        return ActionDelegate.shared.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
