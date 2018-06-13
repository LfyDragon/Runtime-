//
//  Person.m
//  MethodSel
//
//  Created by ios2chen on 2018/6/12.
//  Copyright © 2018年 Lfy. All rights reserved.
//

#import "Person.h"
#import "Animal.h"
#import <objc/runtime.h>

@implementation Person


// 1.消息动态解析
+(BOOL)resolveInstanceMethod:(SEL)sel{
    
//    NSString *methodName = NSStringFromSelector(sel);
//    if ([methodName isEqualToString:@"sendMessage:"]) {
//        //我们可以在这里添加方法的实现
//        return class_addMethod(self, sel, (IMP)sendMessage, "v@:@");
//    }
    
    return NO;
    
}

void sendMessage (id self, SEL _cmd, NSString *message){
    NSLog(@"message=%@",message);
}

// 2.若第一种方法返回NO，则调用此方法，若有其它类实现该方法，则可以转接到其它类。
//   找备用者
-(id)forwardingTargetForSelector:(SEL)aSelector{
    
//    NSString *methodName = NSStringFromSelector(aSelector);
//    if ([methodName isEqualToString:@"sendMessage:"]) {
//        if ([[Animal new] respondsToSelector:aSelector]) {
//            return [Animal new];
//        }
//    }
    
    
    return [super forwardingTargetForSelector:aSelector];
}

//3. 若前两种方法都不处理，则走这里
//    1）方法签名
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMessage:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        }
    return [super methodSignatureForSelector:aSelector];
}
//  2) 签名后，消息转发,找备用者
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    
//    SEL selector = [anInvocation selector];
//    Animal *animal = [Animal new];
//    if ([animal respondsToSelector:selector]) {
//        [anInvocation invokeWithTarget:animal];
//    } else{
//        [super forwardInvocation:anInvocation];
//    }
    
    
    
    //------------------------------------------------------
    //       配合第4步，此方法只需下面一行代码
    //------------------------------------------------------
    [super forwardInvocation:anInvocation];
}

//4.   若前3中方法都不处理，为了防止崩溃，可调用此方法
-(void)doesNotRecognizeSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    NSLog(@"找不到 %@ 这个方法的实现",methodName);
}

@end
