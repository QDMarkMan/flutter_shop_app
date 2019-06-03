package com.example.shop_app;

import android.content.Context;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * Factory Method
 */
public class MyViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    public MyViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @SuppressWarnings("unchecked")
    @Override
    public PlatformView create(Context context, int id, Object args) {
        // Map<String, Object> params = (Map<String, Object>) args;
        return new MyView(context);
    }
}