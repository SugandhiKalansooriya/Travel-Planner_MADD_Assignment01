//
//  Extention.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-25.
//


import UIKit

// MARK: - UIView
extension UIView {
  func anchor(top: NSLayoutYAxisAnchor? = nil,
              left: NSLayoutXAxisAnchor? = nil,
              bottom: NSLayoutYAxisAnchor? = nil,
              right: NSLayoutXAxisAnchor? = nil,
              paddingTop: CGFloat = 0,
              paddingLeft: CGFloat = 0,
              paddingBottom: CGFloat = 0,
              paddingRight: CGFloat = 0,
              width: CGFloat? = nil,
              height: CGFloat? = nil) {

    translatesAutoresizingMaskIntoConstraints = false

    if let top = top {
      topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }

    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }

    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }

    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }

    if let width = width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    if let height = height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }

  func center(inView view: UIView, yConstant: CGFloat? = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
  }

  func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    if let topAnchor = topAnchor {
      self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
    }
  }

  func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = nil, constant: CGFloat? = 0) {
    translatesAutoresizingMaskIntoConstraints = false

    centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true

    if let leftAnchor = leftAnchor, let padding = paddingLeft {
      self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
    }
  }

  func setDimensions(width: CGFloat, height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    widthAnchor.constraint(equalToConstant: width).isActive = true
    heightAnchor.constraint(equalToConstant: height).isActive = true
  }

  func addConstraintsToFillView(_ view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    anchor(top: view.topAnchor, left: view.leftAnchor,
           bottom: view.bottomAnchor, right: view.rightAnchor)
  }

  func pinTo(_ view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: 50).isActive = true
    leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
  }

}

