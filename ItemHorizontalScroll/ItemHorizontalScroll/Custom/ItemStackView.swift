//
//  ItemStackView.swift
//  ItemHorizontalScroll
//
//  Created by 김지태 on 9/10/24.
//

import UIKit

// ItemStackViewDelegate 프로토콜 추가
protocol ItemStackViewDelegate: AnyObject {
    func itemStackView(_ stackView: ItemStackView, didSelectItemAt index: Int)
}

final class ItemStackView: UIStackView {
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 1
        return view
    }()
    
    private var items: [ItemView] = [] {
        didSet {
            self.updateItems()
        }
    }
    
    private var selectedIndex: Int = 0
    
    weak var itemStackViewDelegate: ItemStackViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.alignment = .leading
        self.spacing = 19
        
        self.addSubview(self.underLineView)
        
        self.underLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(10)
            make.bottom.equalToSuperview()
        }
    }
    
    func setSelectIndex(index: Int) {
        self.selectedIndex = index
        self.selectItem(at: index)
    }
    
    func setData(itemStrings: [String], preSelectIndex: Int?) {
        if let index = preSelectIndex {
            self.selectedIndex = index
        }
        
        if (itemStrings.count - 1) < self.selectedIndex {
            self.selectedIndex = itemStrings.count - 1
        }
        
        self.items = itemStrings.enumerated().map { [weak self] index, text in
            let itemView = ItemView()
            itemView.configure(with: text, isSelected: index == self?.selectedIndex)
            
            itemView.button.addAction(UIAction { [weak self] _ in
                guard let self = self else { return }
                self.selectItem(at: index)
            }, for: .touchUpInside)
            
            return itemView
        }
    }
    
    private func updateItems() {
        // Remove existing subviews
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
            
            // Add new subviews
        self.items.forEach { addArrangedSubview($0) }
            
        // Update layout immediately
        self.layoutIfNeeded()
            
        self.selectItem(at: selectedIndex)
    }
        
    private func selectItem(at index: Int) {
        self.selectedIndex = index
        self.itemStackViewDelegate?.itemStackView(self, didSelectItemAt: index)

        for (itemIndex, item) in items.enumerated() {
            let isSelected = itemIndex == selectedIndex
            item.selectItem(isSelected: isSelected)

            if isSelected {
                self.underLineView.snp.remakeConstraints { make in
                    make.height.equalTo(2)
                    make.width.equalTo(item.snp.width)
                    make.centerX.equalTo(item.snp.centerX)
                    make.bottom.equalToSuperview()
                }

                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                    self.layoutIfNeeded()
                }
            }
        }
    }
}
