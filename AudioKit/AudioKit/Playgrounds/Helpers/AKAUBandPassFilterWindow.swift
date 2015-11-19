//
//  AKAUBandPassFilterWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#if os(OSX)
    import Foundation
    import Cocoa

    /// A Window to control AKAUBandPassFilter in Playgrounds
    public class AKAUBandPassFilterWindow: NSWindow {

        private let windowWidth = 400
        private let padding = 30
        private let sliderHeight = 20
        private let numberOfComponents = 2

        /// Slider to control centerFrequency
        public let centerFrequencySlider: NSSlider
        /// Slider to control bandwidth
        public let bandwidthSlider: NSSlider

        private let centerFrequencyTextField: NSTextField
        private let bandwidthTextField: NSTextField

        /// Internal representation of the operation
        var bandPassFilter: AKAUBandPassFilter

        /// Initiate the AKAUBandPassFilter window
        public init(_ control: AKAUBandPassFilter) {
            bandPassFilter = control
            let sliderWidth = windowWidth - 2 * padding

            centerFrequencySlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            bandwidthSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            centerFrequencyTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            bandwidthTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            let titleHeightApproximation = 50
            let windowHeight = padding * 2 + titleHeightApproximation + numberOfComponents * 3 * sliderHeight

            super.init(contentRect: NSRect(x: padding, y: padding, width: windowWidth, height: windowHeight),
                styleMask: NSTitledWindowMask,
                backing: .Buffered,
                `defer`: false)
            self.hasShadow = true
            self.styleMask = NSBorderlessWindowMask | NSResizableWindowMask
            self.movableByWindowBackground = true
            self.level = 7
            self.title = "AKAUBandPassFilter"

            let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
            let view = NSView(frame: viewRect)

            let topTitle = NSTextField()
            topTitle.stringValue = "AKAUBandPassFilter"
            topTitle.editable = false
            topTitle.drawsBackground = false
            topTitle.bezeled = false
            topTitle.alignment = NSCenterTextAlignment
            topTitle.font = NSFont(name: "Lucida Grande", size: 24)
            topTitle.sizeToFit()
            topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
            topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
            view.addSubview(topTitle)

            centerFrequencyTextField.stringValue = "Center Frequency: \(bandPassFilter.centerFrequency) Hz"
            centerFrequencyTextField.editable = false
            centerFrequencyTextField.drawsBackground = false
            centerFrequencyTextField.bezeled = false
            centerFrequencyTextField.frame.origin.y = topTitle.frame.origin.y -  2 *  CGFloat(sliderHeight)
            view.addSubview(centerFrequencyTextField)

            centerFrequencySlider.target = self
            centerFrequencySlider.action = "updateCenterfrequency"
            centerFrequencySlider.minValue = 20
            centerFrequencySlider.maxValue = 22050
            centerFrequencySlider.floatValue = Float(bandPassFilter.centerFrequency)
            centerFrequencySlider.frame.origin.y = topTitle.frame.origin.y - 3 * CGFloat(sliderHeight)
            view.addSubview(centerFrequencySlider)
            bandwidthTextField.stringValue = "Bandwidth: \(bandPassFilter.bandwidth) Cents"
            bandwidthTextField.editable = false
            bandwidthTextField.drawsBackground = false
            bandwidthTextField.bezeled = false
            bandwidthTextField.frame.origin.y = topTitle.frame.origin.y -  5 *  CGFloat(sliderHeight)
            view.addSubview(bandwidthTextField)

            bandwidthSlider.target = self
            bandwidthSlider.action = "updateBandwidth"
            bandwidthSlider.minValue = 100
            bandwidthSlider.maxValue = 12000
            bandwidthSlider.floatValue = Float(bandPassFilter.bandwidth)
            bandwidthSlider.frame.origin.y = topTitle.frame.origin.y - 6 * CGFloat(sliderHeight)
            view.addSubview(bandwidthSlider)

            self.contentView!.addSubview(view)
            self.makeKeyAndOrderFront(nil)
        }

        internal func updateCenterfrequency() {
            bandPassFilter.centerFrequency = centerFrequencySlider.floatValue
            centerFrequencyTextField.stringValue = "Center Frequency \(String(format: "%0.4f", bandPassFilter.centerFrequency)) Hz"
        }
        internal func updateBandwidth() {
            bandPassFilter.bandwidth = bandwidthSlider.floatValue
            bandwidthTextField.stringValue = "Bandwidth \(String(format: "%0.4f", bandPassFilter.bandwidth)) Cents"
        }

        /// Required initializer
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

#endif
