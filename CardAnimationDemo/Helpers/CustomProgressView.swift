//
//  File.swift
//  AnimationDemo
//
//  Created by Chandru on 09/09/23.
//

import UIKit

class CustomProgressView: UIView {
    
    //MARK: - Internal Variables
    private var progressLayer = CALayer()
    private var progressShapeLayer = CALayer()
    
    lazy var proogressLabel: UILabel = {
        //progress valoe label
        let label = UILabel()
        label.textColor = .whiteColor
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: self.frame.width),
            label.heightAnchor.constraint(equalToConstant:  self.frame.height)])
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(progressLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.addSublayer(progressLayer)
    }
    
    var progressColor:UIColor = UIColor.red {
        didSet {
            //progress view fill color
            progressLayer.backgroundColor = progressColor.cgColor
        }
    }
    
    var trackColor:UIColor = UIColor.white {
        didSet {
            //progress view empty track color
            backgroundColor = trackColor
        }
    }
    
    var progress: CGFloat = 0.0 {
        didSet {
            createProgressPath(frame)
        }
    }
    
    override func draw(_ rect: CGRect) {
        createProgressPath(rect)
    }
    
    
    func createProgressPath(_ rect: CGRect) {
        //create rounded rectangle progress view and set fill color
        let backgroundMask = CAShapeLayer()
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height/2).cgPath
        layer.mask = backgroundMask
        
        progressLayer.frame = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
        progressLayer.cornerRadius = rect.height * 0.35
        let progressedValue =  "\(Int(30 * progress )) MB / 30 MB "
        proogressLabel.text = progressedValue
    }
}

