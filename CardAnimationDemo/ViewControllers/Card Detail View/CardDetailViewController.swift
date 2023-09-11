//
//  DetailViewController.swift
//  AnimationDemo
//
//  Created by Chandru on 09/09/23.
//

import UIKit

class CardDetailViewController: UIViewController {

    //MARK: - IBOutlets
  
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var downloadView: UIView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var downloadCancelButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cardsCollectionView: UICollectionView!
    @IBOutlet weak var progressView: CustomProgressView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var readMoreButton: UIButton!
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var downloadViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var downloadViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var downloadViewWidthContraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelLeadingContraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var playButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Internal Variables
    var initialTopViewFrame:CGRect = .zero
    var initialDownloadViewFrame:CGRect = .zero
    var intialTitleLabelFrame:CGRect = .zero
    var cardsCount = 5
    var timer: Timer?
    var progressValue = 0.0
    var collectionViewMinHeight: CGFloat = 350
    var collectionViewCellAnimation = true
    var screeSize = UIScreen.main.bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerCollectionViewCells()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setIntialViewContraints()
    }
    
    private func configureUI() {
        setPlayButtonUI()
        setDownloadViewUIs()
        setProgressViewUI()
        setTitleText()
        descriptionView.alpha = 0
        cardsCollectionView.alpha = 0
        collectionViewLeadingConstraint.constant = 0
        closeButton.transform = CGAffineTransform(translationX: 0, y: 10)
        closeButton.alpha = 0
        self.view.backgroundColor = .whiteColor
    }
    
    private func setDownloadViewUIs() {
        downloadCancelButton.alpha = 0
        downloadCancelButton.isHidden = true
        downloadButton.setTitle("DOWNLOAD\n30MB", for: .normal)
        downloadButton.titleLabel?.lineBreakMode = .byWordWrapping //set mutli line for button
        downloadButton.titleLabel?.textAlignment = .center
        downloadCancelButton.setCirculerView()
    }
    
    private func setTitleText() {
        titleLabel.textAlignment = .left
        titleLabel.text = "CANDY\nBUST"
    }
    
    //Method to set play button initial position
    private func setPlayButtonUI() {
        playButton.setCornerRadius(radius: 30)
        playButtonBottomConstraint.constant = -80
        playButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        playButton.isHidden = true
    }
    
    /// Method to set custom progress bar colors
    func setProgressViewUI() {
        progressView.trackColor = .lightGreenColor
        progressView.progressColor = .greenColor
        progressView.isHidden = true
    }
    
    /// Method to register collection view cells
    private func registerCollectionViewCells() {
        cardsCollectionView.register(UINib(nibName: CollectionViewCellId.grayCardCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellId.grayCardCollectionViewCell)
    }
    
    
    /// Method to set titleLabel, topview, download views to their intial position before animating
    func setIntialViewContraints() {
        topViewTopConstraint.constant =  initialTopViewFrame.minY - view.safeAreaInsets.top
        topViewLeadingConstraint.constant = initialTopViewFrame.minX - view.safeAreaInsets.left
        
        downloadViewBottomConstraint.constant = screeSize.height - initialDownloadViewFrame.maxY - view.safeAreaInsets.bottom
        downloadViewLeadingConstraint.constant = initialDownloadViewFrame.minX - view.safeAreaInsets.left
        downloadViewWidthContraint.constant = initialDownloadViewFrame.width

        titleLabelTopConstraint.constant = intialTitleLabelFrame.minY - view.safeAreaInsets.top
        titleLabelWidthConstraint.constant = intialTitleLabelFrame.width
        titleLabelLeadingContraint.constant = intialTitleLabelFrame.minX - view.safeAreaInsets.left
        downloadButton.alpha = 0
        titleLabelHeightConstraint.constant = intialTitleLabelFrame.height
        self.view.layoutIfNeeded()
        animateViewsToOriginalPosition()

    }
    
    
    
    /// Method to change titleLabel, topview, download views to their original position with animation
    func animateViewsToOriginalPosition() {
        UIView.animate(withDuration: 0.8,
                       delay: 0.0) { [weak self] in
            guard let self = self else { return }
            
            //set title view position
            self.topViewTopConstraint.constant = 20
            self.topViewLeadingConstraint.constant = 20
            
            //set title label position
            self.titleLabelTopConstraint.constant = 10
            self.titleLabelLeadingContraint.constant = 130
            self.titleLabelWidthConstraint.constant = self.screeSize.width - self.titleLabelLeadingContraint.constant - self.closeButton.frame.width - 20
            self.titleLabelHeightConstraint.constant = 60
            //set download view position
            self.downloadViewBottomConstraint.constant = 20
            self.downloadViewWidthContraint.constant =  self.screeSize.width - 60
            self.downloadViewLeadingConstraint.constant = 30
            self.downloadButton.alpha = 1
            self.downloadButton.isHidden = false
            self.view.layoutIfNeeded()
            
        } completion: {  [weak self] flag in
            guard let self = self else { return }
            self.showDescriptionView()
            
            
        }
    }
    
    
    /// Method to show description and collection view with animation
    func showDescriptionView() {
     
        UIView.animate(withDuration: 0.6,
                       delay: 0.0, options: .curveEaseInOut) { [weak self] in
            guard let self = self else { return }
            self.closeButton.transform = CGAffineTransform(translationX: 0, y: 0)
            self.closeButton.alpha = 1
            self.descriptionView.alpha = 1
            self.cardsCollectionView.alpha = 1
            self.collectionViewLeadingConstraint.constant = 0
            self.cardsCollectionView.reloadData()
            self.view.layoutIfNeeded()
        } completion: { [weak self] flag in
            guard let self = self else { return }
            self.collectionViewCellAnimation = false
            
        }
    }
    
    
    
    /// Method show progress view and cancel with animation
    private func startDownload() {
        downloadButton.isUserInteractionEnabled = false
        downloadCancelButton.isHidden = false
        downloadCancelButton.alpha = 0
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.downloadCancelButton.alpha = 1
            self.downloadViewWidthContraint.constant = self.screeSize.width - 95
            self.view.layoutIfNeeded()
        } completion: { [weak self] flag in
            guard let self = self else { return }
            self.progressView.isHidden = false
            self.downloadButton.isHidden = true
            self.startProgressAnimation()
        }
    }
    
    /// Methos to stop the download progress and show download button with animation
    private func cancelDownload() {
        resetProgressView()
        progressView.isHidden = true
        downloadButton.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.downloadCancelButton.alpha = 0
            self.downloadViewWidthContraint.constant = self.screeSize.width - 60
            self.view.layoutIfNeeded()
            
        } completion: { [weak self] flag in
            guard let self = self else { return }
            self.downloadCancelButton.isHidden = true
            self.progressView.isHidden = true
            self.downloadButton.isHidden = false
        }
    }
    
    
    /// Method to start progress animation  using timer api
    func startProgressAnimation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        guard let timer = timer else { return }
        RunLoop.main.add(timer, forMode: .common) //to fire timer event even when view is scrolling
    }
    
    /// Method to update progress bar value
    @objc func updateProgress() {
        progressValue += 0.015
        progressView.progress = progressValue
        progressView.layoutIfNeeded()
        if progressValue >= 1 {
            timer?.invalidate()
            downloadCancelButton.setImage(UIImage(named:"tick_icon"), for: .normal)
            showPlayButton()
        }
    }
    
    
    
    /// Method to reset progress bar value
    func resetProgressView() {
        self.timer?.invalidate()
        progressView.progress = 0
        progressValue = 0
    }
    
    
    /// Method to show play button and hide progress view with animation
    private func showPlayButton() {
        playButton.isHidden = false
        playButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.9) { [weak self] in
            guard let self = self else { return }
            
            self.downloadView.alpha = 0
            self.progressView.alpha = 0
            self.downloadCancelButton.alpha = 0
            self.playButtonBottomConstraint.constant = 20
            self.playButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.view.layoutIfNeeded()
        } completion: {  [weak self] flag in
            guard let self = self else { return }
            
            self.resetProgressView()
            self.progressView.isHidden = true
            self.downloadButton.isUserInteractionEnabled = true
            self.downloadViewWidthContraint.constant = self.screeSize.width - 60
            self.downloadCancelButton.setImage(UIImage(named: "cancel_icon"), for: .normal)
            self.playButton.flash()
            
        }
    }
    
    /// Method to present bottom sheet view controller
    private func showSheetScreen() {
        let sheetVC = SheetViewController(nibName: ViewControllerId.sheetViewController, bundle: nil)
        sheetVC.modalPresentationStyle = .overCurrentContext
        present(sheetVC, animated: true, completion: {
            sheetVC.dismissButton.alpha = 1
        })
//        We can remove animation of playbutton if needed
//        playButton.layer.removeAnimation(forKey: "blink")
    }
    
    
    /// Methos to expand or shrink the description view
    /// - Parameter isExpand: Denotes boolean vlaue for view expand or shrink
    private func expandOrShrinkDescriptionView(isExpand: Bool) {
        let contentHeight = getContentHeight()
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self = self else { return }
            self.descriptionViewHeightConstraint.constant = isExpand ? (contentHeight + 40) : 100
            //add contentHeight to actual content view height
            self.contentViewHeightConstraint.constant = isExpand ? ( self.contentViewHeightConstraint.constant + contentHeight) : ( self.contentViewHeightConstraint.constant - contentHeight)
            self.view.layoutIfNeeded()
        } completion: { [weak self] flag in
            guard let self = self else { return }
            self.readMoreButton.setTitle(isExpand ? "READ LESS" : "READ MORE", for: .normal)
            
        }
    }
    
    /// Method to get description content height
    /// - Returns: Returns description content height
    private func getContentHeight() -> CGFloat {
        let contentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: descriptionLabel.frame.width, height: 30))
        contentLabel.text = descriptionLabel.text
        contentLabel.font = descriptionLabel.font
        contentLabel.numberOfLines = 0
        let contentLabelSize = contentLabel.sizeThatFits(CGSize(width:descriptionLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
        return contentLabelSize.height
    }
    
    //MARK: - IBActions
    @IBAction func actionOnCloseButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionOnDownloadButton(_ sender: Any) {
        startDownload()
    }
    
    @IBAction func actionOnReadMoreButton(_ sender: Any) {
        expandOrShrinkDescriptionView(isExpand: descriptionViewHeightConstraint.constant == 100)
    }
    
    @IBAction func actionOnDownloadCancelButton(_ sender: Any) {
        cancelDownload()
    }
    
    @IBAction func actionOnPlayButton(_ sender: Any) {
        showSheetScreen()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension CardDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cardsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellId.grayCardCollectionViewCell, for: indexPath) as! GrayCardCollectionViewCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        //check if collection view is visible or not using collectionViewCellAnimation variable
        if collectionViewCellAnimation {
            //animate cell from view minmum scalex/scaley size to their original size and
            //animate cell xAxis position
            cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            cell.transform = CGAffineTransform( translationX: self.cardsCollectionView.frame.width * (Double(indexPath.row+1)),
                y: 0)
            cell.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row)) {
                cell.alpha = 1
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                cell.layoutIfNeeded()
            }
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (cardsCollectionView.frame.width/2) - 10,
               height: cardsCollectionView.frame.height)
    }
    
    
}
