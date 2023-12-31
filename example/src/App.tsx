import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { InputKitView } from 'react-native-input-kit';

export default function App() {
  return (
    <View style={styles.container}>
      <InputKitView
        color="#329852"
        onChangeText={({ text }) => {
          console.log('ValueData:: ', text);
        }}
        value={'value'}
        style={styles.box}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: '100%',
    height: 60,
    marginVertical: 20,
  },
});
