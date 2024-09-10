//
//  ItemStackView.swift
//  ItemHorizontalScroll
//
//  Created by 김지태 on 9/10/24.
//

import UIKit

// Protocol for handling item selection in ItemStackView
protocol ItemStackViewDelegate: AnyObject {
    func itemStackView(_ stackView: ItemStackView, didSelectItemAt index: Int)
}

final class ItemStackView: UIStackView {
    // Underline view to indicate the selected item
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 1
        return view
    }()
    
    // Array to store ItemView instances
    private var items: [ItemView] = [] {
        didSet {
            self.updateItems()
        }
    }
    
    // Index of the currently selected item
    private var selectedIndex: Int = 0
    
    // Delegate to handle item selection
    weak var itemStackViewDelegate: ItemStackViewDelegate?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Initialize UI components
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
    
    // Set the selected index
    func setSelectIndex(index: Int) {
        self.selectedIndex = index
        self.selectItem(at: index)
    }
    
    // Configure the stack view with item data
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
    
    // Update the arranged subviews
    private func updateItems() {
        // Remove existing subviews
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
            
        // Add new subviews
        self.items.forEach { addArrangedSubview($0) }
            
        // Update layout immediately
        self.layoutIfNeeded()
            
        self.selectItem(at: selectedIndex)
    }
        
    // Handle item selection
    private func selectItem(at index: Int) {
        self.selectedIndex = index
        self.itemStackViewDelegate?.itemStackView(self, didSelectItemAt: index)

        for (itemIndex, item) in items.enumerated() {
            let isSelected = itemIndex == selectedIndex
            item.selectItem(isSelected: isSelected)

            if isSelected {
                // Update underline position and width
                self.underLineView.snp.remakeConstraints { make in
                    make.height.equalTo(2)
                    make.width.equalTo(item.snp.width)
                    make.centerX.equalTo(item.snp.centerX)
                    make.bottom.equalToSuperview()
                }

                // Animate the underline movement
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                    self.layoutIfNeeded()
                }
            }
        }
    }
}
