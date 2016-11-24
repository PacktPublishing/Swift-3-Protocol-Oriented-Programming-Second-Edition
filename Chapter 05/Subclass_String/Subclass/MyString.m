//
//  MyString.m
//  Subclass
//
//  Created by Jon Hoffman on 11/24/15.
//  Copyright © 2015 Jon Hoffman. All rights reserved.
//

#import "MyString.h"

@interface MyString ()
@property (nonatomic, strong) NSString *stringHolder;
@end

@implementation MyString: NSString

- (instancetype)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer {
    self = [super init];
    if (self) {
        self.stringHolder = [[NSString alloc] initWithCharactersNoCopy:characters length:length freeWhenDone:freeBuffer];
    }
    return self;
}

- (NSUInteger)length {
    return self.stringHolder.length;
}

- (unichar)characterAtIndex:(NSUInteger)index {
    return [self.stringHolder characterAtIndex:index];
}


-(unichar)getFirstCharacter {
    
    return [self.stringHolder characterAtIndex:0];
}

@end
