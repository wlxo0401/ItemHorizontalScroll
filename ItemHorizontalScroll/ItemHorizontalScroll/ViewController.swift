//
//  ViewController.swift
//  ItemHorizontalScroll
//
//  Created by 김지태 on 9/10/24.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    // ItemScrollViewDelegate 준수를 명시적으로 선언
    private lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var itemScrollView: ItemScrollView = {
        let view = ItemScrollView()
        view.itemScrollViewDelegate = self
        return view
    }()
    
    private lazy var dataSetOneButton: UIButton = {
        let button = UIButton()
        button.setTitle("DataSetOneButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.loadDataSetOne()
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var dataSetTwoButton: UIButton = {
        let button = UIButton()
        button.setTitle("DataSetTwoButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.loadDataSetTwo()
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var dataSetThreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("DataSetThreeButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.loadDataSetThree()
        }, for: .touchUpInside)
        return button
    }()
    
    private var originData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initUI()
    }
    
    private func initUI() {
        self.view.backgroundColor = .gray
        self.view.addSubview(self.itemLabel)
        self.view.addSubview(self.itemScrollView)
        self.view.addSubview(self.dataSetOneButton)
        self.view.addSubview(self.dataSetTwoButton)
        self.view.addSubview(self.dataSetThreeButton)
        
        self.itemLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(self.itemScrollView.snp.top).offset(-24)
        }
        
        self.itemScrollView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        self.dataSetOneButton.snp.makeConstraints {
            $0.top.equalTo(self.itemScrollView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(24)
        }
        
        self.dataSetTwoButton.snp.makeConstraints {
            $0.top.equalTo(self.dataSetOneButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(24)
        }
        
        self.dataSetThreeButton.snp.makeConstraints {
            $0.top.equalTo(self.dataSetTwoButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(24)
        }
    }
    
    private func loadDataSetOne() {
        self.originData = ["APPLE", "Car", "Microsoft", "Mac", "iPad"]
        self.itemScrollView.setData(itemStrings: originData, preSelectIndex: nil)
    }
    
    private func loadDataSetTwo() {
        self.originData = ["APPLE", "Car", "Microsoft"]
        self.itemScrollView.setData(itemStrings: originData, preSelectIndex: 0)
    }
    
    private func loadDataSetThree() {
        self.originData = ["APPLE", "Car", "Microsoft", "Intel", "AMD", "CPU",
                           "HYUNDAI", "MOBIS", "GLOVIS", "GM"]
        self.itemScrollView.setData(itemStrings: originData, preSelectIndex: 0)
    }
}

// ItemScrollViewDelegate 준수를 확장으로 분리
extension ViewController: ItemScrollViewDelegate {
    func didSelectItem(at index: Int) {
        let item = self.originData[index]
        self.itemLabel.text = "Selected Index: \(index), Item: \(item)"
    }
}
