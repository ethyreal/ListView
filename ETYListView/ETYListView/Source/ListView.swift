//
//  ListView.swift
//  ListView
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit


public final class ListView<Item>: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private(set) var sections:[SectionDescriptor<Item>]
    
    let cellDescriptor:(Item) -> CellDescriptor
    
    var reuseIdentifiers:Set<String> = []
    
    public var willDisplay:( (UITableViewCell, Item) -> () )?
    
    public var didSelect:(Item) -> () = { _ in }
    
    public var didDeSelect:(Item) -> () = { _ in }
    
    public init(frame:CGRect = .zero, style:UITableViewStyle = .grouped, sections:[SectionDescriptor<Item>], cellDescriptor: @escaping (Item) -> CellDescriptor) {
        
        self.sections = sections
        self.cellDescriptor = cellDescriptor
        
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
    }
    
    public convenience init(frame:CGRect = .zero, style:UITableViewStyle = .plain, items:[Item], cellDescriptor: @escaping (Item) -> CellDescriptor) {
        
        let sections = [SectionDescriptor<Item>(items:items)]
        
        self.init(frame:frame, style:style,sections:sections, cellDescriptor: cellDescriptor)
    }
    
    public convenience init<Cell: UITableViewCell>(frame:CGRect = .zero, style:UITableViewStyle = .plain, items:[Item], configure: @escaping (Cell, Item) -> ()) {
        
        let sections = [SectionDescriptor<Item>(items:items)]
        
        self.init(frame:frame, style:style, sections:sections) { item in
            return CellDescriptor() { (cell:Cell) in
                configure(cell, item)
            }
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func reload(items:[Item]) {
        
        self.sections = [SectionDescriptor<Item>(items:items)]
        
        self.reloadData()
    }
    
    public func reload(sections:[SectionDescriptor<Item>]) {
        
        self.sections = sections
        
        self.reloadData()
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.item(for:indexPath)
        
        let descriptor = self.cellDescriptor(item)
        
        if !self.reuseIdentifiers.contains(descriptor.reuseIdentifier) {
            tableView.register(descriptor.cellClass, forCellReuseIdentifier: descriptor.reuseIdentifier)
            self.reuseIdentifiers.insert(descriptor.reuseIdentifier)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.reuseIdentifier, for: indexPath)
        
        descriptor.configure(cell)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let willDisplay = self.willDisplay {
            let item = self.item(for:indexPath)
            willDisplay(cell, item)
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.item(for:indexPath)
        self.didSelect(item)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let item = self.item(for:indexPath)
        self.didDeSelect(item)
    }
    
    func item(for indexPath:IndexPath) -> Item {
        let section = self.sections[indexPath.section]
        return section.items[indexPath.row]
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        return section.headerTitle
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = self.sections[section]
        return section.headerView
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let section = self.sections[section]
        return section.footerTitle
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let section = self.sections[section]
        return section.footerView
    }
}


