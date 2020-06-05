//
//  SwiftNotification.swift
//  SwiftNotification
//
//  Created by iOS on 2020/4/23.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

public extension NSObject {
    
    private struct Associated {
        static var NotificationCenterKey: String = "NotificationCenterKey"
    }
    
    /// 通知中心
    var notifiCenter: NotificationTool {
        get {
            if let center =  objc_getAssociatedObject(self, &Associated.NotificationCenterKey) as? NotificationTool{
                return center
            }else{
                let de = NotificationTool()
                self.notifiCenter = de
                return de
            }
        }
        set (newValue){
            objc_setAssociatedObject(self, &Associated.NotificationCenterKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
 
}
 
public class NotificationTool: NSObject {
    
    var observers = [String : Any]()
    
    deinit {
        removeAllObserver()
    }
    
    /// 移除所有通知
    public func removeAllObserver(){
        observers.keys.forEach { (name) in
            removeObserverWithName(name)
        }
    }
    
    /// 移除单个通知
    /// - Parameter name: 通知名称
    public func removeObserverWithName(_ name : String?){
        guard let na = name, let ob = observers[na] else { return }
        NotificationCenter.default.removeObserver(ob)
    }
    
    /// 移除多个通知
    /// - Parameter names: 通知名称数组
    public func removeObserverWithNames(_ names : [String]){
        names.forEach { (name) in
            removeObserverWithName(name)
        }
    }
    
    /// 注册添加通知
    /// - Parameters:
    ///   - name: 通知名称
    ///   - callBack: 通知执行的回调
    public func addNotification(_ name : String, callBack : @escaping (Notification) -> Void){
        let ob = NotificationCenter.default.addObserver(forName: NSNotification.Name.init(rawValue: name), object: nil, queue: OperationQueue.main, using: callBack)
        observers.updateValue(ob, forKey: name)
    }
    
    
    /// 发送通知
    /// - Parameters:
    ///   - name: 通知名称
    ///   - object: 发送对象
    ///   - userInfo: 发送字典
    public func postNotification(_ name : String, object: Any? = nil, userInfo : [String : Any]? = nil){
        NotificationQueue.default.enqueue(Notification.init(name: Notification.Name.init(rawValue: name), object: object, userInfo: userInfo), postingStyle: .whenIdle, coalesceMask: .onName, forModes: nil)
    }
}
