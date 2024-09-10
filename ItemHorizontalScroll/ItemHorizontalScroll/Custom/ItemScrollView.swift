//
//  ItemScrollView.swift
//  ItemHorizontalScroll
//
//  Created by 김지태 on 9/10/24.
//

import UIKit

// Protocol for handling item selection in ItemScrollView
protocol ItemScrollViewDelegate: AnyObject {
    func didSelectItem(at index: Int)
}

final class ItemScrollView: UIScrollView {
    // ItemStackView to manage the items within the scroll view
    private lazy var itemStackView: ItemStackView = {
        let view = ItemStackView()
        view.itemStackViewDelegate = self
        return view
    }()
    
    // Delegate to handle item selection
    weak var itemScrollViewDelegate: ItemScrollViewDelegate?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initScroll()
        self.initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure scroll view properties
    private func initScroll() {
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.alwaysBounceHorizontal = true
        self.backgroundColor = .white
        self.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    // Set up the UI components
    private func initUI() {
        let containerView: UIView = {
            let view = UIView()
            view.addSubview(self.itemStackView)
            self.itemStackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            return view
        }()
        
        self.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(self.snp.height)
        }
    }
    
    // Set the selected index in the ItemStackView
    func setSelectIndex(index: Int) {
        self.itemStackView.setSelectIndex(index: index)
    }
    
    // Configure the ItemStackView with item data
    func setData(itemStrings: [String], preSelectIndex: Int?) {
        self.itemStackView.setData(itemStrings: itemStrings, preSelectIndex: preSelectIndex)
    }
}

// Extension to act as a mediator between ItemScrollView and ItemScrollViewDelegate
extension ItemScrollView: ItemStackViewDelegate {
    func itemStackView(_ stackView: ItemStackView, didSelectItemAt index: Int) {
        self.itemScrollViewDelegate?.didSelectItem(at: index)
    }
}
