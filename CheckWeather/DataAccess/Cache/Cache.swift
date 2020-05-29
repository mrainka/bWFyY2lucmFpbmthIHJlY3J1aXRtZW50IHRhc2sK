//
//  Cache.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Foundation

final class Cache<Item> {

    var item: Item?

    private var liveTimer: Timer?

    var onCleaned: (() -> Void)?

    @objc private func clean() {
        invalidateLiveTimer()
        item = nil
        onCleaned?()
    }

    private func invalidateLiveTimer() {
        liveTimer?.invalidate()
        liveTimer = nil
    }

    func keepAlife(for timeToLive: TimeInterval) {
        invalidateLiveTimer()
        liveTimer = .weakScheduledTimer(
            timeInterval: timeToLive,
            target: self,
            selector: #selector(clean),
            userInfo: nil,
            repeats: false)
    }
}

private extension Timer {

    final class WeakTarget {

        private var selector: Selector

        private weak var target: AnyObject?

        init(selector: Selector, target: AnyObject) {
            self.selector = selector
            self.target = target
        }

        @objc func timerDidFire(timer: Timer) {
            guard let target = target else {
                timer.invalidate()
                return
            }

            unsafeBitCast(
                target.method(for: selector),
                to: (@convention(c) (AnyObject, Selector) -> Void).self)(target, selector)
        }
    }

    static func weakScheduledTimer(
        timeInterval ti: TimeInterval,
        target aTarget: AnyObject,
        selector aSelector: Selector,
        userInfo: Any?,
        repeats yesOrNo: Bool)
            -> Timer
    {
        .scheduledTimer(
            timeInterval: ti,
            target: WeakTarget(selector: aSelector, target: aTarget),
            selector: #selector(WeakTarget.timerDidFire),
            userInfo: userInfo,
            repeats: yesOrNo)
    }
}
