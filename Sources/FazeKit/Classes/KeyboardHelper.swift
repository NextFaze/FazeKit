//
//  KeyboardHelper.swift
//  FazeKit
//
//  Created by Ric Santos on 8/5/2024.
//

import Foundation

public class KeyboardHelper {
    public static func getAnimationOptions(notification: Notification) -> UIView.AnimationOptions? {
        guard let keyboardAnimationCurve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return nil }
        return UIView.AnimationOptions(rawValue: keyboardAnimationCurve << 16)
    }
    
    public static func getAnimationDuration(notification: Notification) -> TimeInterval? {
        return notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
    }
    
    public static func getKeyboardFrameEnd(notification: Notification) -> CGRect? {
        return (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
        
    public static func animateInSyncWithKeyboard(notification: Notification, animations: @escaping () -> Void) {
        let duration = self.getAnimationDuration(notification: notification) ?? 0.0
        let options = self.getAnimationOptions(notification: notification) ?? UIView.AnimationOptions(rawValue: 0)
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations)
    }
}
