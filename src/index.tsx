import {
  requireNativeComponent,
  UIManager,
  Platform,
  type ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-input-kit' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type InputKitProps = {
  color: string;
  style: ViewStyle;
};

const ComponentName = 'InputKitView';

export const InputKitView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<InputKitProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
