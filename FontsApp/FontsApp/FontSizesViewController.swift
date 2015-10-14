//
//  FontSizesViewController.swift
//  FontsApp
//
//  Created by Brian J Glowe on 10/13/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    
    var font: UIFont!
    private var pointSizes: [CGFloat] {
        struct Constants {
            static let pointSizes: [CGFloat] = [9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144]
        }
        return Constants.pointSizes
    }
    private let cellIdentifier = "FontNameAndSizes"
    
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont {
        let pointSize = pointSizes[indexPath.row]
        return font.fontWithSize(pointSize)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return pointSizes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel!.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel!.text = font.fontName
        cell.detailTextLabel!.text = "\(pointSizes[indexPath.row]) point"
    
        return cell
    }
    
}
