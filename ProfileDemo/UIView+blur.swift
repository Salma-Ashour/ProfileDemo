//
//  UIView+Blur.swift
//  Blur
//
//  Created by Roman Sorochak <roman.sorochak@gmail.com> on 6/27/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//
import UIKit

extension UIView {

    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescriptiveName.blurView"
    }

    private (set) var blurView: BlurView {
        get {
            if let blurView = objc_getAssociatedObject(
                self,
                &AssociatedKeys.descriptiveName
                ) as? BlurView {
                return blurView
            }
            self.blurView = BlurView(to: self)
            return self.blurView
        }
        set(blurView) {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.descriptiveName,
                blurView,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

    class BlurView {

        private var superview: UIView
        private var blur: UIVisualEffectView?
        private var editing: Bool = false
        private (set) var blurContentView: UIView?
        private (set) var vibrancyContentView: UIView?

        var animationDuration: TimeInterval = 0.1

        /**
         * Blur style. After it is changed all subviews on
         * blurContentView & vibrancyContentView will be deleted.
         */
        var style: UIBlurEffect.Style = .light {
            didSet {
                guard oldValue != style,
                    !editing else { return }
                applyBlurEffect()
            }
        }
        /**
         * Alpha component of view. It can be changed freely.
         */
        var alpha: CGFloat = 0 {
            didSet {
                guard !editing else { return }
                if blur == nil {
                    applyBlurEffect()
                }
                let alpha = self.alpha
                UIView.animate(withDuration: animationDuration) {
                    self.blur?.alpha = alpha
                }
            }
        }

        init(to view: UIView) {
            self.superview = view
        }

        func setup(style: UIBlurEffect.Style, alpha: CGFloat) -> Self {
            self.editing = true

            self.style = style
            self.alpha = alpha

            self.editing = false

            return self
        }

        func enable(isHidden: Bool = false) {
            if blur == nil {
                applyBlurEffect()
            }

            self.blur?.isHidden = isHidden
        }

        private func applyBlurEffect() {
            blur?.removeFromSuperview()

            applyBlurEffect
        }

        private func applyBlurEffect(style: UIBlurEffectStyle,
                                     blurAlpha: CGFloat) UIBlurEffect.Styleerview.backgroundColor = UIColor.clear

            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)

            let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
            let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
            blurEffectView.contentView.addSubview(vibrancyView)

            blurEffectView.alpha = blurAlpha

            superview.insertSubview(blurEffectView, at: 0)

            blurEffectView.addAlignedConstrains()
            vibrancyView.addAlignedConstrains()

            self.blur = blurEffectView
            self.blurContentView = blurEffectView.contentView
            self.vibrancyContentView = vibrancyView.contentView
        }
    }

    private func addAlignedConstrains() {
        translatesAutoresizingMaskIntoConstraints = false
        addAlignConstraintToSuperview(attribute: NSLayoutAttribute.top)
        addAlignConstraintToSuperview(attribute: NSLayoutAttribute.leaNSLayoutConstraint.AttributeAlignConstraintToSuperview(attribute: NSLayoutAttributeNSLayoutConstraint.Attribute  addAlignConstraintToSuperview(attribute: NSLayoutAttribute.bottom)
    }

private func addAlignConstraintToSuperview(attribute: NNSLayoutConstraint.Attribute {
        superview?.addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: attribute,
                relatedBy: NSLayoutRelation.equal,
                toItem: superview,
                attribute: attribute,
                multiplier: 1,
                constant: 0
            )
        )
    }
}
