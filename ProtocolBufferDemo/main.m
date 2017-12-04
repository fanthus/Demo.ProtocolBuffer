//
//  main.m
//  ProtocolBufferDemo
//
//  Created by Fan's iMac  on 12/4/17.
//  Copyright © 2017 Fan's iMac . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.pbobjc.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *personRoot = [[Person alloc] init];
        personRoot.name = @"hello";
        NSData *personData = [personRoot delimitedData];
        NSLog(@"length %lu",(unsigned long)personData.length);
        //二进制数据反序列化为对象
        GPBCodedInputStream *inputStream = [GPBCodedInputStream streamWithData:personData];
        NSError *error;
        Person *per = [Person parseDelimitedFromCodedInputStream:inputStream extensionRegistry:nil error:&error];
        NSLog(@"person = %@",per.name);
    }
    return 0;
}
