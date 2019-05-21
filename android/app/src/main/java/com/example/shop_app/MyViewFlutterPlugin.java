package com.example.shop_app;

import io.flutter.plugin.common.PluginRegistry;
//import com.example.shop_app.MyViewFactory;

public class MyViewFlutterPlugin {
  public static void registerWith(PluginRegistry registry) {
    final String key = MyViewFlutterPlugin.class.getCanonicalName();

    if (registry.hasPlugin(key))
      return;

    PluginRegistry.Registrar registrar = registry.registrarFor(key);
    registrar.platformViewRegistry().registerViewFactory("plugins.views/myView", new MyViewFactory(registrar.messenger()));
  }
}