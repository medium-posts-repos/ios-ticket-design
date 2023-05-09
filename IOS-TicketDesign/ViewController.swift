//
//  ViewController.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit
import Foundation

public final class ViewController: UIViewController {
    
    public var onPrimaryActionTapped: (()-> Void)? = nil
        
    private lazy var confettiImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "confetti_background"), contentMode: .scaleAspectFill)
        return imageView
    }()
    
    private lazy var containerBackgroundImage: UIImageView = {
        let imageView = UIImageView(image: .init(named: "ic_abstract_bg"), contentMode: .scaleToFill) // replace your container bg
        return imageView
    }()
    
    private lazy var blurContainer: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    private var cardContainer = UIView(backgroundColor: .clear)
    
    private final let seeReceiptView: ExpandCollapseArchView = {
        let view = ExpandCollapseArchView()
        view.buttonLabel.text = "See Receipt"
        view.actionButton.isHidden = true
        view.buttonImage = UIImage(named: "arrow_down")?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    private final let showLessArchView: ExpandCollapseArchView = {
        let view = ExpandCollapseArchView()
        view.buttonLabel.text = "Show Less"
        view.buttonImage = UIImage(named: "arrow_up")?.withRenderingMode(.alwaysTemplate)
        return view
    }()

    private lazy var receiptContainer: ReceiptConfirmationView = {
       let view = ReceiptConfirmationView()
        view.options = [
            .init(label: "Receiver's Number", value: "982343243"),
            .init(label: "Sender's Number", value: "982134342"),
            .init(label: "Amount", value: "Rs. 1200"),
            .init(label: "Remarks", value: "Utility payment"),
            .init(label: "Cashback", value: "20"),
            .init(label: "Invoice", value: "Payment details"),
            .init(label: "Charge", value: "Rs. 4"),
        ]
        return view
    }()
    
    private final lazy var totalAmountContainer: TxnAmountContainer = {
        let view = TxnAmountContainer()
        view.amountTitleLabel.text = "Transaction Amount"
        view.amountDescLabel.text = "Rs.200"
        return view
    }()
    
    private final let primaryActionButton: UIButton = {
        let button = UIButton(backgroundColor: .darkGray)
        button.setTitle("Done", for: .normal)
        button.setBorder(radius: 16)
        return button
    }()
    
    private final let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
        
    private lazy var successTopContainer: TxnSuccessTopContainer = {
        let view = TxnSuccessTopContainer()
        view.successTitleLabel.text = "Yay! Money Sent Successfully"
        return view
    }()

    private final let bottomContainer = UIView()
    private final let scrollContainer = UIView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
    }
    
    public func setupViews() {
        view.addSubview(blurContainer)
        blurContainer.fillSuperview()

        containerBackgroundImage.isUserInteractionEnabled = true
                   
        blurContainer.contentView.addSubViews(containerBackgroundImage)
        containerBackgroundImage.fillSuperview()
        
        containerBackgroundImage.addSubViews(scrollView, bottomContainer)
        scrollView.addSubViews(scrollContainer)
        
        scrollContainer.fillSuperview()
        scrollContainer.widthAnchor.constraint(equalTo: containerBackgroundImage.widthAnchor).isActive = true
        scrollContainer.addSubViews(cardContainer)
                
        NSLayoutConstraint.activate([
            bottomContainer.leadingAnchor.constraint(equalTo: containerBackgroundImage.leadingAnchor, constant: 16),
            bottomContainer.trailingAnchor.constraint(equalTo: containerBackgroundImage.trailingAnchor, constant: -16),
            bottomContainer.bottomAnchor.constraint(equalTo: containerBackgroundImage.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            cardContainer.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            cardContainer.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            cardContainer.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            cardContainer.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),

            scrollView.leadingAnchor.constraint(equalTo: containerBackgroundImage.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: containerBackgroundImage.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: containerBackgroundImage.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomContainer.topAnchor)
        ])

        successTopContainer.setContentHuggingPriority(.defaultHigh, for: .vertical)
        bottomContainer.stack(primaryActionButton.withHeight(48))
            
        cardContainer.stack(
            successTopContainer,
            UIView(backgroundColor: .white).withHeight(20),
            seeReceiptView.withHeight(42),
            receiptContainer,
            showLessArchView.withHeight(42),
            UIView(backgroundColor: .white).withHeight(8),
            totalAmountContainer,
            RainBowArchView().withHeight(22),
            UIView()
        ).padBottom(24)
        
        cardContainer.addSubViews(confettiImageView)

        NSLayoutConstraint.activate([
            confettiImageView.heightAnchor.constraint(equalToConstant: 140),
            confettiImageView.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor),
            confettiImageView.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor),
            confettiImageView.topAnchor.constraint(equalTo: cardContainer.topAnchor)
        ])
    }
    
    public func setupBindings() {}
    public func setupActions() {
        seeReceiptView.actionButton.addTapListener {
            self.seeReceiptView.actionButton.scaleViewAnimate {
                self.receiptContainer.animateHidden(isHidden: false, withDuration: 0.25, shouldAlpha: false)
                self.showLessArchView.isHidden = false
                self.seeReceiptView.actionButton.isHidden = true
            }
        }
        
        showLessArchView.actionButton.addTapListener {
            self.showLessArchView.actionButton.scaleViewAnimate {
                self.receiptContainer.animateHidden(isHidden: true, withDuration: 0.1, shouldAlpha: false)
                self.showLessArchView.isHidden = true
                self.seeReceiptView.actionButton.isHidden = false
            }
        }
        
        primaryActionButton.addTapListener {
            self.primaryActionButton.scaleViewAnimate {
                self.onPrimaryActionTapped?()
                self.dismiss(animated: true)
            }
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.hidesBackButton = true
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
