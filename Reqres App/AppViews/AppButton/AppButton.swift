//
//  AppButton.swift
//  Reqres App
//
//  Created by Girish Parate on 15/08/21.
//

import Foundation
import UIKit
@IBDesignable
class AppButton: UIView {
    @IBOutlet weak var view: UIView!
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//    }
    
    let nibName = "AppButton"
    var contentView:UIView?
    
    @IBOutlet weak var lable: UILabel!
    @IBAction func ontap(_ sender: Any) {
        print("im the button")
        lable.text = "Hi"
    }
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
     }
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         commonInit()
     }
     
     func commonInit() {
         guard let view = loadViewFromNib() else { return }
         view.frame = self.bounds
         self.addSubview(view)
         contentView = view
     }
     
     func loadViewFromNib() -> UIView? {
         let bundle = Bundle(for: type(of: self))
         let nib = UINib(nibName: nibName, bundle: bundle)
         return nib.instantiate(withOwner: self, options: nil).first as? UIView
     }
}
