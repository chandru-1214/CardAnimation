//
//  SheetViewController.swift
//  AnimationDemo
//
//  Created by Chandru on 09/09/23.
//

import UIKit

class SheetViewController: UIViewController {
    
    //MARK: - IBOutlets
    //first view
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstViewTopView: UIView!
    @IBOutlet weak var firsViewSecondView: UIStackView!
    @IBOutlet weak var circleViewOfFirstLeftView: UIView!
    @IBOutlet weak var middleViewOfFirstLeftView: UIView!
    @IBOutlet weak var lastViewOfFirstLeftView: UIView!
    @IBOutlet weak var circleViewOfFirstRightView: UIView!
    @IBOutlet weak var middleViewOfFirstRightView: UIView!
    @IBOutlet weak var lastViewOfFirstRightView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    //second view
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondViewFirstHeaderView: UIView!
    @IBOutlet weak var secondViewFirstSubView: UIView!
    @IBOutlet weak var secondViewSecondSubView: UIView!
    @IBOutlet weak var secondViewFirstCircleView: UIView!
    @IBOutlet weak var secondViewSecondCircleView: UIView!
    @IBOutlet weak var secondViewThirdCircleView: UIView!
    @IBOutlet weak var secondViewBottomSubView: UIView!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label15: UILabel!
    //third view
    @IBOutlet weak var secondViewNumbersStackView: UIStackView!
    @IBOutlet weak var secondViewSecondHeaderView: UIView!
    @IBOutlet weak var readyToPlayLabel: UILabel!
    @IBOutlet weak var thirdViewFirstRectangleView: UIView!
    @IBOutlet weak var thirdViewSecondRectangleView: UIView!
    @IBOutlet weak var thirdViewThirdRectangleView: UIView!
    @IBOutlet weak var rectanglesStackview: UIStackView!
    @IBOutlet weak var thirdViewThirdTitleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var viewType: SheetViewType = .firstView
    var animationDuration = 0.4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setViewType()
    }
    
    private func configureUI() {
        setCornerRadiusForViews()
        dismissButton.alpha = 0
        showFirstView()
    }
    
    
    private func setCornerRadiusForViews() {
        //first View
        nextButton.setCornerRadius(radius: 30)
        firstViewTopView.setCornerRadius(radius: 5)
        circleViewOfFirstLeftView.setCirculerView()
        middleViewOfFirstLeftView.setCornerRadius(radius: 5)
        lastViewOfFirstLeftView.setCornerRadius(radius: 5)
        circleViewOfFirstRightView.setCirculerView()
        middleViewOfFirstRightView.setCornerRadius(radius: 5)
        lastViewOfFirstRightView.setCornerRadius(radius: 5)
        //Second View
        secondViewFirstSubView.setCornerRadius(radius: 5)
        secondViewSecondSubView.setCornerRadius(radius: 5)
        secondViewFirstCircleView.setCirculerView()
        secondViewSecondCircleView.setCirculerView()
        secondViewThirdCircleView.setCirculerView()
        //third View
        thirdViewFirstRectangleView.setCornerRadius(radius: 25)
        thirdViewSecondRectangleView.setCornerRadius(radius: 25)
        thirdViewThirdRectangleView.setCornerRadius(radius: 25)
    }
    
    /// Method to show header view based on viewType value
    func setViewType() {
        switch viewType {
        case .firstView:
            showFirstView()
            showFirstViewAnimation()
        case .secondView:
            showSecondView()
        case .thirdView:
            showThirdView()
        }
    }
    
    
    private func showFirstView() {
        firstView.isHidden = false
        secondView.isHidden = true
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .greenColor
        setFirstViewsInitialPostions()
    }
    
    private func showSecondView() {
        firstView.isHidden = true
        secondView.isHidden = false
        secondViewFirstHeaderView.isHidden = false
        secondViewSecondHeaderView.isHidden = true
        setSecondViewsInitialPostions()
        showSecondViewAnimation()
    }
    
    private func showThirdView() {
        firstView.isHidden = true
        secondView.isHidden = false
        secondViewFirstHeaderView.isHidden = true
        secondViewSecondHeaderView.isHidden = false
        nextButton.setTitle("Confirm", for: .normal)
        nextButton.backgroundColor = .blackColor
        setThirdViewsInitialPostions()
        showThirdViewAnimation()
        
    }
    
    /// Method to set first header view intial position before animation
    private func setFirstViewsInitialPostions() {
        
        firstViewTopView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        circleViewOfFirstLeftView.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                                y: 0)
        middleViewOfFirstLeftView.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                                y: 0)
        lastViewOfFirstLeftView.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                              y: 0)
        
        circleViewOfFirstRightView.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                                 y: 0)
        middleViewOfFirstRightView.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                                 y: 0)
        lastViewOfFirstRightView.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                               y: 0)
    }
    
    /// Method to set second header views intial position before animation
    private func setSecondViewsInitialPostions() {
        secondViewFirstSubView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        secondViewBottomSubView.transform = CGAffineTransform(translationX:0,
                                                                 y: 50)
        secondViewNumbersStackView.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                                 y: 0)
        label5.transform = CGAffineTransform(translationX: -30,
                                                                 y: 0)
        label5.transform = CGAffineTransform(translationX: -30,
                                                                 y: 0)
        label5.transform = CGAffineTransform(translationX: -30,
                                                                 y: 0)
    }
    
    /// Method to set third header views intial position before animation
    private func setThirdViewsInitialPostions() {
        readyToPlayLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        titleLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        thirdViewThirdTitleView.transform = CGAffineTransform(translationX:0,
                                                              y: -20)
        rectanglesStackview.transform = CGAffineTransform(translationX:self.view.frame.width,
                                                                 y: 0)
    }
    
    
    /// Method to move first header views to their with animation
    private func showFirstViewAnimation() {
        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self = self else { return }
            self.firstViewTopView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.firstViewTopView.layoutIfNeeded()
        }

        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self = self else { return }
            self.circleViewOfFirstLeftView.transform = CGAffineTransform(translationX:0,
                                                                         y: 0)
            self.circleViewOfFirstRightView.transform = CGAffineTransform(translationX:0,
                                                                          y: 0)
            self.circleViewOfFirstLeftView.layoutIfNeeded()
            self.circleViewOfFirstRightView.layoutIfNeeded()
        }
        
        //adding delay for bottom view
        UIView.animate(withDuration: animationDuration, delay: 0.1) { [weak self] in
            guard let self = self else { return }
            self.middleViewOfFirstLeftView.transform = CGAffineTransform(translationX:0,
                                                                         y: 0)
            self.middleViewOfFirstRightView.transform = CGAffineTransform(translationX:0,
                                                                          y: 0)
            self.middleViewOfFirstLeftView.layoutIfNeeded()
            self.middleViewOfFirstRightView.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: animationDuration, delay: 0.2) { [weak self] in
            guard let self = self else { return }
            
            self.lastViewOfFirstLeftView.transform = CGAffineTransform(translationX:0,
                                                                       y: 0)
            self.lastViewOfFirstRightView.transform = CGAffineTransform(translationX:0,
                                                                        y: 0)
            self.lastViewOfFirstLeftView.layoutIfNeeded()
            self.lastViewOfFirstRightView.layoutIfNeeded()
        }
        
    }
    
    /// Method to set second header views intial position before animation
    private func showSecondViewAnimation() {
        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self = self else { return }
            self.secondViewFirstSubView.transform = CGAffineTransform(scaleX: 1, y: 1)
          
            self.secondViewFirstSubView.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.2) { [weak self] in
            guard let self = self else { return }
            self.secondViewBottomSubView.transform = CGAffineTransform(translationX:0,
                                                                         y: 0)
            self.secondViewNumbersStackView.transform = CGAffineTransform(translationX:0,
                                                                          y: 0)
            self.secondViewBottomSubView.layoutIfNeeded()
            self.secondViewNumbersStackView.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.1) { [weak self] in
            guard let self = self else { return }
            self.label5.transform = CGAffineTransform(translationX:0,
                                                      y: 0)
            self.label10.transform = CGAffineTransform(translationX:0,
                                                       y: 0)
            self.label5.transform = CGAffineTransform(translationX:0,
                                                      y: 0)
            self.label5.layoutIfNeeded()
            self.label10.layoutIfNeeded()
            self.label5.layoutIfNeeded()
        }
        
    }
    
    /// Method to set third header views intial position before animation
    private func showThirdViewAnimation() {
        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self = self else { return }
            self.readyToPlayLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.titleLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.thirdViewThirdTitleView.transform = CGAffineTransform(translationX:0,
                                                                  y: 0)
            self.readyToPlayLabel.layoutIfNeeded()
            self.titleLabel.layoutIfNeeded()
            self.thirdViewThirdTitleView.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.2) { [weak self] in
            guard let self = self else { return }
            self.rectanglesStackview.transform = CGAffineTransform(translationX:0,
                                                                         y: 0)
            self.rectanglesStackview.layoutIfNeeded()
        }
    }
    
    
    
    /// Method to dissmiss view controller
    private func dismissView() {
        dismissButton.alpha = 0
        dismiss(animated: true)
    }
    
    
    
    //MARK: - IBActions

    @IBAction func actionOnNextButton(_ sender: Any) {
        //set next header view type
        viewType = viewType == .firstView ? .secondView : viewType == .secondView ? .thirdView : .firstView
        if viewType == .firstView {
            dismissView()
        } else {
            setViewType()
        }
    }
    
    @IBAction func actionOnDismissButton(_ sender: Any) {
        dismissView()
    }
    
}
