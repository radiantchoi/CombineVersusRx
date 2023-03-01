//
//  ViewController.swift
//  CombineVersusRx
//
//  Created by Gordon Choi on 2023/03/02.
//

import Combine
import UIKit

import RxCocoa
import RxSwift
import SnapKit

final class ViewController: UIViewController {
    // 수행해볼 것: 발신과 수신, map, zip, combineLatest
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    private lazy var combineFirstLabel: UILabel = {
        let label = UILabel()
        label.text = "Combine 1"
        return label
    }()
    
    private lazy var combineSecondLabel: UILabel = {
        let label = UILabel()
        label.text = "Combine 2"
        return label
    }()
    
    private lazy var combineMergedLabel: UILabel = {
        let label = UILabel()
        label.text = "Combine merged"
        return label
    }()
    
    private lazy var rxFirstLabel: UILabel = {
        let label = UILabel()
        label.text = "RxSwift 1"
        return label
    }()
    
    private lazy var rxSecondLabel: UILabel = {
        let label = UILabel()
        label.text = "RxSwift 2"
        return label
    }()
    
    private lazy var rxMergedLabel: UILabel = {
        let label = UILabel()
        label.text = "RxSwift merged"
        return label
    }()
    
    private lazy var combineFirstStreamButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemRed
        button.setTitle("C1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var combineSecondStreamButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemBlue
        button.setTitle("C2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var rxFirstStreamButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemRed
        button.setTitle("R1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var rxSecondStreamButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemBlue
        button.setTitle("R2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var combineZipButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemGreen
        button.setTitle("combineZip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var combineLatestButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemCyan
        button.setTitle("combineCombineLatest", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var rxZipButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemGreen
        button.setTitle("rxZip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var rxCombineLatestButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemCyan
        button.setTitle("rxCombineLatest", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var combineLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var combineButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var combineOperationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var rxOperationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var rxLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var rxButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var contentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(contentsStackView)
        contentsStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        setupContentsStackView()
    }
    
    private func setupContentsStackView() {
        contentsStackView.addArrangedSubview(combineLabelStackView)
        contentsStackView.addArrangedSubview(combineButtonStackView)
        contentsStackView.addArrangedSubview(combineOperationStackView)
        contentsStackView.addArrangedSubview(rxLabelStackView)
        contentsStackView.addArrangedSubview(rxButtonStackView)
        contentsStackView.addArrangedSubview(rxOperationStackView)
        
        setupCombineStackView()
        setupRxStackView()
    }
    
    private func setupCombineStackView() {
        combineLabelStackView.addArrangedSubview(combineFirstLabel)
        combineLabelStackView.addArrangedSubview(combineSecondLabel)
        combineLabelStackView.addArrangedSubview(combineMergedLabel)
        
        combineButtonStackView.addArrangedSubview(combineFirstStreamButton)
        combineButtonStackView.addArrangedSubview(combineSecondStreamButton)
        
        combineOperationStackView.addArrangedSubview(combineZipButton)
        combineOperationStackView.addArrangedSubview(combineLatestButton)
    }
    
    private func setupRxStackView() {
        rxLabelStackView.addArrangedSubview(rxFirstLabel)
        rxLabelStackView.addArrangedSubview(rxSecondLabel)
        rxLabelStackView.addArrangedSubview(rxMergedLabel)
        
        rxButtonStackView.addArrangedSubview(rxFirstStreamButton)
        rxButtonStackView.addArrangedSubview(rxSecondStreamButton)
        
        rxOperationStackView.addArrangedSubview(rxZipButton)
        rxOperationStackView.addArrangedSubview(rxCombineLatestButton)
    }
}

