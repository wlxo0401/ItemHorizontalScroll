//
//  ItemScrollView.swift
//  ItemHorizontalScroll
//
//  Created by 김지태 on 9/10/24.
//

import UIKit

protocol ItemScrollViewDelegate: AnyObject {
    func didSelectItem(at index: Int)
}

final class ItemScrollView: UIScrollView {
    private lazy var itemStackView: ItemStackView = {
        let view = ItemStackView()
        view.itemStackViewDelegate = self
        return view
    }()
    
    weak var itemScrollViewDelegate: ItemScrollViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initScroll()
        self.initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initScroll() {
        self.alwaysBounceHorizontal = true
        self.backgroundColor = .white
        self.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
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
    
    func setSelectIndex(index: Int) {
        self.itemStackView.setSelectIndex(index: index)
    }
    
    func setData(itemStrings: [String], preSelectIndex: Int?) {
        self.itemStackView.setData(itemStrings: itemStrings, preSelectIndex: preSelectIndex)
    }
}

// ItemScrollView와 ItemScrollViewDelegate 사이의 중개자 역할
extension ItemScrollView: ItemStackViewDelegate {
    func itemStackView(_ stackView: ItemStackView, didSelectItemAt index: Int) {
        self.itemScrollViewDelegate?.didSelectItem(at: index)
    }
}
