{
  pkgs,
  ...
}:
{
  system.defaults = {
    NSGlobalDomain = {
      # マウス/トラックパッド
      "com.apple.swipescrolldirection" = true; # ナチュラルスクロールを有効化
      # キーボード
      NSAutomaticCapitalizationEnabled = false; # 文頭の自動大文字化を無効化
      NSAutomaticPeriodSubstitutionEnabled = false; # ピリオドの自動置換を無効化
      NSAutomaticSpellingCorrectionEnabled = false; # スペル自動修正を無効化
      NSAutomaticDashSubstitutionEnabled = false; # ダッシュの自動置換を無効化
      NSAutomaticQuoteSubstitutionEnabled = false; # クォートの自動置
      # UI
      AppleInterfaceStyle = "Dark"; # ダークモードを有効化
      NSWindowResizeTime = 0.001; # ウィンドウのリサイズ速度を高速化
    };
    # Finder
    finder = {
      AppleShowAllExtensions = true; # ファイル拡張子を常に表示
      AppleShowAllFiles = true; # 隠しファイルを表示
      FXDefaultSearchScope = "SCcf"; # 検索範囲をカレントフォルダに設定
      ShowPathbar = true; # パスバーを表示
      FXEnableExtensionChangeWarning = false; # ファイル拡張子変更の警告を無効化
      FXPreferredViewStyle = "Nlsv"; # デフォルトの表示方法をリストビューに設定
    };
    # Dock
    dock = {
      show-process-indicators = true; # 起動中アプリをインジケーターに表示
      static-only = true; # 最近使ったアプリを非表示
      launchanim = false; # アプリ起動時のアニメーションを無効化
      mineffect = "scale"; # ウィンドウを閉じるときのエフェクトをスケールに設定
    };
    # 画面キャプチャ
    screencapture = {
      target = "clipboard"; # スクリーンショットの保存先をクリップボードに設定
      disable-shadow = true; # スクリーンショットの影を無効化
    };
    # その他
    CustomUserPreferences = {
      NSGlobalDomain = {
        # キーボード
        WebAutomaticSpellingCorrectionEnabled = false; # スペル自動修正を無効化 (WebView)
        # Finder
        AppleMenuBarVisibleInFullscreen = true; # フルスクリーン時にメニューバーを表示
      };
    };
  };

  # キーマッピング
  system.keyboard = {
    enableKeyMapping = true;
    userKeyMapping =
      let
        remap = src: dst: {
          HIDKeyboardModifierMappingSrc = src;
          HIDKeyboardModifierMappingDst = dst;
        };
        # Key-map References:
        #   https://developer.apple.com/library/archive/technotes/tn2450/_index.html
        # macOS Fn key:
        #   https://github.com/UltimateHackingKeyboard/agent/issues/1366
        left_control = 30064771296; # 0xE0
        left_command = 30064771299; # 0xE3
        caps_lock = 30064771129; # 0x39
        fn_key = 1095216660483; # 0xFF00000003
      in
      [
        # Left Control <-> GUI(Command)
        (remap left_control left_command)
        (remap left_command left_control)
        # Caps Lock -> Fn
        (remap caps_lock fn_key)
      ];
  };

  # 電源設定
  power = {
    sleep = {
      allowSleepByPowerButton = false; # 電源ボタンでスリープを無効化
      computer = 60; # 自動スリープまでの時間（分）
      display = 60; # ディスプレイの自動スリープまでの時間（分）
    };
  };
}
