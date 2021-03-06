//
//  MGBaseLabel.swift
//  AuthorizedStore
//
//  Created by Magical Water on 2018/2/28.
//  Copyright © 2018年 Magical Water. All rights reserved.
//

import UIKit

@IBDesignable class MGBaseLabel: UILabel {

    //觸摸回饋
    @IBInspectable var touchAlpha: Bool = false

    private var onClickListener: ((UIView) -> Void)?

    //如同android view一樣
    public func setOnClickListener(_ handler: ((UIView) -> Void)?) {
        self.onClickListener = handler
    }

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touchAlpha { self.alpha = 0.7 }
    }
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touchAlpha { self.alpha = 1 }
    }
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touchAlpha { self.alpha = 1 }
        onClickListener?(self)
    }

}
