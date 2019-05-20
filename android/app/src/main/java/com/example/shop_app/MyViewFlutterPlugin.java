
public class MyViewFlutterPlugin {
  public static void registerWith(PluginRegistry registry) {
    final String key = MyViewFlutterPlugin.class.getCanonicalName();

    if (registry.hasPlugin(key))
      return;

    PluginRegistry.Registrar registrar = registry.registrarFor(key);
    registrar.platformViewRegistry().registerViewFactory("plugins.views/myview",
        new MyViewFactory(registrar.messenger()));
  }
}