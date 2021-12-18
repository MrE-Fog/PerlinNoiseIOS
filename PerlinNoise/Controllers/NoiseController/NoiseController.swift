//
//  NoiseController.swift
//  PerlinNoise
//
//  Created by Admin on 16.12.2021.
//

import UIKit

class NoiseController: UIViewController {
    lazy var customView: NoiseView = NoiseView()
    
    override func loadView() {
        view = customView
    }
}

