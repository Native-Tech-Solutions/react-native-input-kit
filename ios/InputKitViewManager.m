#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(InputKitViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)

RCT_EXPORT_VIEW_PROPERTY(value, NSString)
RCT_EXPORT_VIEW_PROPERTY(onChangeText, RCTDirectEventBlock)


@end
