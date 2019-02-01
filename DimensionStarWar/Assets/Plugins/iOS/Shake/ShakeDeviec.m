//
//  ShakeDeviec.m
//  Unity-iPhone
//
//  Created by Anda on 2018/3/3.
//

#import <Foundation/Foundation.h>
#import "ShakeDevice.h"
#import "WXApi.h"
/*@interface ShakeDeviece()<UNUserNotificationCenterDelegate>// : <#superclass#>

@end*/


@implementation ShakeDeviece
UIImpactFeedbackGenerator* generator;




/*- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    //AppController_SendNotificationWithArg(kUnityDidRegisterForRemoteNotificationsWithDeviceToken, deviceToken);
    //UnitySendDeviceToken(deviceToken);
    /NSString *tokenStr = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    tokenStr = [tokenStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@ 输出Object-C字符串\n", tokenStr);
    UnitySendMessage("Main Camera", "SetUserDeviceToken", tokenStr.UTF8String);
    //UnitySendMessage("ApplicationController", "onPushID",tokenStr.UTF8String);
    //NSLog(tokenStr.UTF8String);
    
}*/

//这是向微信终端注册你的appid
void _WechatLogin()
{
    [WXApi registerApp:@"wx7cd5e9a4694a2399"];
    if([WXApi isWXAppInstalled])
    {
        SendAuthReq* req = [[SendAuthReq alloc] init];
        req.scope = @"snsapi_userinfo";
        req.state = @"%12334";//[NSString stringWithFormat:@"%12334", @"123"];
        [WXApi sendReq:req];
    }
}


void _ShakeDevice(int adress)
{
    switch (adress) {
        case 1:
            generator =[[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleLight];
            break;
        case 2:
            generator =[[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleMedium];
            break;
        case 3:
            generator =[[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleHeavy];
            break;
        default:
            generator =[[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleLight];
            break;
    }
    [generator prepare];
    [generator impactOccurred];
}

/*void _RegisterRemoteNoti()
{
    //[ShakeDeviece InitVok];
    
    
}*/

@end
