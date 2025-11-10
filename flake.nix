{
  description = "Flutter dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    android-nixpkgs.url = "github:tadfisher/android-nixpkgs/stable";
    android-nixpkgs.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        rec {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          packages.android-sdk = inputs.android-nixpkgs.sdk.${system} (
            sdkPkgs: with sdkPkgs; [
              cmdline-tools-latest
              build-tools-35-0-0
              build-tools-36-0-0
              platform-tools
              platforms-android-36
              emulator
              system-images-android-36-google-apis-playstore-x86-64
              ndk-27-0-12077973
              cmake-3-22-1
            ]
          );
          devShells.default =
            with pkgs;
            pkgs.mkShell rec {
              ANDROID_SDK_ROOT = "${packages.android-sdk}/share/android-sdk";
              ANDROID_HOME = "${packages.android-sdk}/share/android-sdk";
              JAVA_HOME = pkgs.jdk.home;
              CHROME_EXECUTABLE = "${pkgs.ungoogled-chromium}/bin/chromium";
              ANDROID_AVD_HOME = "$HOME/.config/.android/avd";

              buildInputs = [
                flutter
                jdk
                gradle
                packages.android-sdk
                android-studio

                pkg-config

                gst_all_1.gstreamer
                gst_all_1.gst-plugins-good
                gst_all_1.gst-plugins-base
                gst_all_1.gst-libav
                gst_all_1.gstreamermm

                gtk3
              ];
            };
        };
    };
}
