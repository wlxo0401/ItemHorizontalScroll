//
//  ItemView.swift
//  ItemHorizontalScroll
//
//  Created by 김지태 on 9/10/24.
//

import UIKit

final class ItemView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    internal lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.addSubview(self.label)
        self.addSubview(self.button)
        
        self.label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.leading.trailing.equalToSuperview().inset(4)
        }
        self.button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with text: String, isSelected: Bool) {
        self.label.text = text
        self.selectItem(isSelected: isSelected)
    }
        
    func selectItem(isSelected: Bool) {
        self.label.textColor = isSelected ? .black : .gray
    }
}
