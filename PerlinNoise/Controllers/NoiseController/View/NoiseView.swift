//
//  NoiseView.swift
//  PerlinNoise
//
//  Created by Admin on 16.12.2021.
//

import UIKit

final class NoiseView: UIView {
    // MARK: - Properties
    
    private var result: [CGFloat] = []
    
    // MARK: - Init
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addActionHandlers()
    }
    
    // MARK: - Overriden methods
    
    override func draw(_ rect: CGRect) {
        backgroundColor = .black
        generatePerlinNoiseValues(octaves: 5)
        let path = UIBezierPath()
        path.move(to: .zero)
        let width: Int = Int(frame.width)
        for x in 0 ..< width {
            path.addLine(to: CGPoint(x: CGFloat(x), y: result[x] * frame.height))
        }
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        UIColor.white.setFill()
        path.close()
        path.fill()
    }
    
    // MARK: - Private methods
    
    private func generatePerlinNoiseValues(octaves: Int) {
        result = []
        let width: Int = Int(frame.width)
        var seed: [Float] = []
        for _ in 0 ..< width {
            seed.append(Float.random(in: 0...1))
        }
        for x in 0 ..< width {
            var fNoise: Float = 0.0
            var fScale: Float = 1.0
            var fScaleAcc: Float = 0.0
            for o in 0 ..< octaves {
                let nPinch: Int = width >> o
                let nSample1: Int = (x / nPinch) * nPinch
                let nSample2: Int = (nSample1 + nPinch) % width
                
                let fBlend: Float = Float(x - nSample1) / Float(nPinch)
                let fSample: Float = (1.0 - fBlend) * seed[nSample1] + fBlend * seed[nSample2]
                fNoise += fSample * fScale
                
                fScaleAcc += fScale
                fScale = fScale / 2.0
            }
            result.append(CGFloat(fNoise / fScaleAcc))
        }
    }
    
    // MARK: - Action handlers
    
    private func addActionHandlers() {
        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(screenDidTap)
        )
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func screenDidTap() {
        setNeedsDisplay()
    }
}
