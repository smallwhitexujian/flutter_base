
# ios项目说明

ios项目在项目运行钱需要配置`ios/Podfile`文件,在所有方法之前配置;

```oc
def fix_mmkv_plugin_name(flutter_application_path)
  is_module = false
  plugin_deps_file = File.expand_path(File.join(flutter_application_path, '..', '.flutter-plugins-dependencies'))
  if not File.exists?(plugin_deps_file)
    is_module = true;
    plugin_deps_file = File.expand_path(File.join(flutter_application_path, '.flutter-plugins-dependencies'))
  end

  plugin_deps = JSON.parse(File.read(plugin_deps_file)).dig('plugins', 'ios') || []
  plugin_deps.each do |plugin|
    if plugin['name'] == 'mmkv' || plugin['name'] == 'mmkvflutter'
      require File.expand_path(File.join(plugin['path'], 'tool', 'mmkvpodhelper.rb'))
      mmkv_fix_plugin_name(flutter_application_path, is_module)
      return
    end
  end
  raise "Fail to find any mmkv plugin dependencies. If you're running pod install manually, make sure flutter pub get is executed first"
end

fix_mmkv_plugin_name(File.dirname(File.realpath(__FILE__)))
```
