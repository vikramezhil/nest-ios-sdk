// Copyright (c) 2016 Petro Akzhygitov <petro.akzhygitov@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NestSDKProductResourceDataModel.h"
#import "NestSDKUtils.h"

@implementation NestSDKProductResourceDataModel
#pragma mark Override

- (void)setMeasurementTimeWithNSString:(NSString *)measurementTimeString {
    self.measurementTime = [NestSDKUtils dateWithISO8601FormatDateString:measurementTimeString];
}

- (id)JSONObjectForMeasurementTime {
    return [NestSDKUtils iso8601FormatDateStringWithDate:self.measurementTime];
}

- (void)setMeasurementResetTimeWithNSString:(NSString *)measurementResetTimeString {
    self.measurementResetTime = [NestSDKUtils dateWithISO8601FormatDateString:measurementResetTimeString];
}

- (id)JSONObjectForMeasurementResetTime {
    return [NestSDKUtils iso8601FormatDateStringWithDate:self.measurementResetTime];
}

- (void)copyPropertiesToDataModelCopy:(id <NestSDKDataModelProtocol>)copy {
    [super copyPropertiesToDataModelCopy:copy];

    NestSDKProductResourceDataModel *productResourceDataModelCopy = (NestSDKProductResourceDataModel *) copy;
    productResourceDataModelCopy.value = self.value;
    productResourceDataModelCopy.measurementTime = self.measurementTime;
    productResourceDataModelCopy.measurementResetTime = self.measurementResetTime;
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;

    result = (NSUInteger) (prime * result + self.value);
    result = prime * result + self.measurementTime.hash;
    result = prime * result + self.measurementResetTime.hash;

    return result;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;

    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    NestSDKProductResourceDataModel *otherProductResource = (NestSDKProductResourceDataModel *) other;
    return (([NestSDKUtils object:self.measurementTime isEqualToObject:otherProductResource.measurementTime]) &&
            ([NestSDKUtils object:self.measurementResetTime isEqualToObject:otherProductResource.measurementResetTime]) &&
            (self.value == otherProductResource.value));
}

@end