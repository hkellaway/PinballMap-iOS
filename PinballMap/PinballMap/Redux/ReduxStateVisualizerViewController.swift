//
//  ReduxStateVisualizerViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxStateVisualizerViewController: StateVisualizerViewController, StoreSubscriber {
    
    var store: Store<State>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.subscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        architectureTextField.text = "Redux"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    override func architectureName() -> String {
        return "Redux"
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        stateTextView.text = state.description
    }
    
}
