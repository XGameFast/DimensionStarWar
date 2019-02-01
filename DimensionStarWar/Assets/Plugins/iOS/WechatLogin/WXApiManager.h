//
//  WXApiManager.h
//  Unity-iPhone
//
//  Created by anda on 2019/1/31.
//

#ifndef WXApiManager_h
#define WXApiManager_h
#endif /* WXApiManager_h */

#import <Foundation/Foundation.h>

#import "WXApi.h"

@interface WXApiManager : UIResponder<UIApplicationDelegate, WXApiDelegate>

+ (instancetype)shareManager;

@end

