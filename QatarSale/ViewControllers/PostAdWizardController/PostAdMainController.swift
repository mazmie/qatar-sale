//
//  PostAdMainControllerViewController.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

class PostAdMainController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var selectedCategoryLbl: UILabel!
    @IBOutlet weak var pagerContainerView: UIView!
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var progressBar: CircularProgressBar!
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    var direction: UIPageViewController.NavigationDirection = .forward
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressBar.setProgress(to: 0.2, withAnimation: true)
        
        pageViewController.view.frame = pagerContainerView.bounds
    }
    
    func setup() {
        titleLbl.setup(font: .nunito(type: .regular, size: 20), color: ._282828)
        categoryLbl.setup(font: .nunito(type: .bold, size: 18), color: ._282828)
        selectedCategoryLbl.setup(font: .nunito(type: .regular, size: 15), color: ._878787)
        
        setupNextBtn()
        setupPager()
        setCurrentController()
        setupButtonContainerView()
        setupProgressBar()
        
        closeBtn.setTitle("", for: .normal)
        closeBtn.setImage(UIImage(named: "times")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    private func setupNextBtn() {
        nextBtn.titleLabel?.setup(font: .nunito(type: .bold, size: 20), color: .white)
        nextBtn.layer.cornerRadius = nextBtn.layer.frame.height / 2
        nextBtn.clipsToBounds = true
        nextBtn.backgroundColor = ThemeManager.Color._1b418d.color
        nextBtn.setTitleColor(.white, for: .normal)
    }
    
    private func setupButtonContainerView() {
        buttonContainerView.backgroundColor = .clear
        let gradient = CAGradientLayer()
        gradient.frame = buttonContainerView.bounds
        gradient.colors = [
            UIColor.white.withAlphaComponent(0).cgColor,
            UIColor.white.cgColor,
            UIColor.white.cgColor
        ]
        buttonContainerView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupPager() {
        pagerContainerView.addSubview(pageViewController.view)
        self.addChild(pageViewController)
        pageViewController.didMove(toParent: self)
    }
    
    private func setCurrentController() {
        let controller = PostAdCategoryController()
        controller.selectedCategoryDidChange = { title in
            self.selectedCategoryLbl.textColor = ThemeManager.Color._0091ff.color
            self.selectedCategoryLbl.text = title
        }
        DispatchQueue.main.async {
            self.pageViewController.setViewControllers(
                [controller],
                direction: self.direction,
                animated: true,
                completion: nil)
        }
    }
    
    func setupProgressBar() {
        progressBar.lineWidth = 5
//        progressBar.safePercent = 100
        progressBar.lineBackgroundColor = ThemeManager.Color._ebebeb.color
        progressBar.lineColor = ThemeManager.Color._0091ff.color
        progressBar.lineFinishColor = ThemeManager.Color._0091ff.color
        
        progressBar.label.text = "1 of 5"
        progressBar.labelSize = 11
    }
}
