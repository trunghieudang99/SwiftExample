//
//  UITableViewExtension.swift
//  CustomerApp
//
//  Created by Bee on 9/22/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
    
    func configureData<T: JSONParsable>(_ data: T)
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib? {
        return UINib(nibName: reuseIdentifier.self, bundle: nil)
    }
    
    func configureData<T: JSONParsable>(_ data: T) {}
}

// MARK: -

extension UITableView {
    
    /// Set table header view & add Auto layout.
    func setTableHeaderView(headerView: UIView) {
        // Set first.
        self.tableHeaderView = headerView
        
        // Then setup AutoLayout.
        headerView.snp.makeConstraints { (make) in
            make.top.centerX.width.equalTo(self)
        }
    }
    
    /// Update header view's frame.
    func updateHeaderViewFrame() {
        guard let headerView = self.tableHeaderView else { return }
        
        // Update the size of the header based on its internal content.
        headerView.layoutIfNeeded()
        
        // ***Trigger table view to know that header should be updated.
        let header = self.tableHeaderView
        self.tableHeaderView = header
    }
}

// MARK: Extension for keeping offset after reloading
extension UITableView {
    
    func reloadDataAndKeepOffset() {
        // stop scrolling
        setContentOffset(contentOffset, animated: false)
        
        // calculate the offset and reloadData
        let beforeContentSize = contentSize
        reloadData()
        layoutIfNeeded()
        let afterContentSize = contentSize
        
        // reset the contentOffset after data is updated
        let newOffset = CGPoint(
            x: contentOffset.x + (afterContentSize.width - beforeContentSize.width),
            y: contentOffset.y + (afterContentSize.height - beforeContentSize.height))
        setContentOffset(newOffset, animated: false)
    }
    
    func scrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: max(0, sections-1))
        if (rows > 0 && sections > 0) {
            self.scrollToRow(at: IndexPath.init(row: (rows-1), section: (sections-1)), at: .bottom, animated: animated)
        }
    }
    
    func scrollToTop(animated: Bool = true) {
        self.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: animated)
    }
}

// MARK: - Register and Dequeue Cell

public extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T:Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerReusableHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T:Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            return T()
        }
        return view
    }
}
