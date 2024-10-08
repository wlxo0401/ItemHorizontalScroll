//
//  ItemView.swift
//  ItemHorizontalScroll
//
//  Created by 김지태 on 9/10/24.
//

import UIKit

final class ItemView: UIView {
    // Label to display the item text
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    // Button to handle user interaction
    internal lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set up the UI components
    private func initUI() {
        self.addSubview(self.label)
        self.addSubview(self.button)
        
        // Configure constraints for label
        self.label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.leading.trailing.equalToSuperview().inset(4)
        }
        
        // Configure constraints for button
        self.button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // Configure the item view with text and selection state
    func configure(with text: String, isSelected: Bool) {
        self.label.text = text
        self.selectItem(isSelected: isSelected)
    }
    
    // Update the visual state based on selection
    func selectItem(isSelected: Bool) {
        self.label.textColor = isSelected ? .black : .gray
    }
}
