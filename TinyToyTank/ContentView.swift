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
    
    func handleTankForwardPressed() {
        //self.delegate.action = .tankForward
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankForward.post()
        }
    }
    
    func handleTankLeftPressed() {
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankForward.post()
        }
    }
    
    func handleTankRightPressed() {
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankForward.post()
        }
    }
    
    func handleFireTurretPressed() {
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankForward.post()
        }
    }
    
    func handleTurretRightPressed() {
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankForward.post()
        }
    }
    
    func handleTurretLeftPressed() {
        if let anchor = arView.scene.anchors[0] as? TinyToyTank._TinyToyTank {
            anchor.notifications.tankForward.post()
        }
    }
    
    init() {
        arView = ARView(frame: .zero)
        let tankAnchor = try! TinyToyTank.load_TinyToyTank()
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
