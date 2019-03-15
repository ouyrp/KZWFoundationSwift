//
//  KZWEnvironmentManager.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/15.
//

import Foundation

public class KZWEnvironmentManager {
    
    public enum KZWEnvironment{
        case KZWEnvTesting
        case KZWEnvBeta
        case KZWEnvAlpha
        case KZWEnvProduction
    }
    
    public static var KZWNotificationWillChangeEnvironment = Notification.Name("KZWNotificaitonWillChangeNotification")
    public static var KZWNotificationDidChangeEnvironment = Notification.Name("KZWNotificationDidChangeEnvironment")
    public static var Environment = KZWEnvironment.KZWEnvProduction
    
    public func setEnvironment(environment: KZWEnvironment) {
        if KZWEnvironmentManager.Environment == environment {
            return
        }
        if Thread.current.isMainThread {
            NotificationCenter.default.post(name: KZWEnvironmentManager.KZWNotificationWillChangeEnvironment, object: nil)
            KZWEnvironmentManager.Environment = environment
        }else {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: KZWEnvironmentManager.KZWNotificationDidChangeEnvironment, object: nil)
                KZWEnvironmentManager.Environment = environment
            }
        }
    }
    
    public func environment() ->KZWEnvironment {
        return KZWEnvironmentManager.Environment
    }
    
    public func isProduction() ->Bool {
        return KZWEnvironmentManager.Environment == KZWEnvironment.KZWEnvProduction
    }
    
}


