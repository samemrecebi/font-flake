<div align="center">
    <h1>Font Flake for NixOS</h1>
    <img src="https://camo.githubusercontent.com/6c587786c40763574c1a811ef06e3c7aa93f0daacec04b672e12243c4b066847/68747470733a2f2f6275696c74776974686e69782e6f72672f62616467652e737667"/>
</div>

This repository contains a Nix flake for packaging custom fonts, (`IBMPlexMono` and `CascadiaCode` were provided as examples) making it easy to include them in your NixOS or Home Manager setup.

## Features

- **Font Packaging**: The flake provides derivations for the fonts, allowing you to easily include them in your NixOS or Home Manager configuration.
- **Default Package**: The `IBMPlexMono` font is set as the default package, which will be built or installed when you run `nix build` without specifying a package name.

## Usage

1. **Add the Flake Input**: Include this repository as a flake input in your main NixOS configuration or Home Manager configuration.

   ```nix
   {
     inputs = {
       nixpkgs.url = "github:NixOS/nixpkgs";
       font-flake.url = "github:your-username/your-repo";
     };
   }
   ```

1. **Install Fonts**: Reference the font packages by name in your Home Manager configuration.

   ```nix
   {
     home.packages = with pkgs; [
       inputs.font-flake.packages.${system}.my-font1
       inputs.font-flake.packages.${system}.my-font2
     ];
   }
   ```

1. **Default Package**: To build or install the default package (`IBMPlexMono`), you can run:

   ```sh
   nix build "github:your-username/your-repo"
   ```

## Customization

If you wish to change the fonts packaged in this flake, consider forking this repository and modifying the flake accordingly. The steps for adding the flake input and installing the fonts will remain the same.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or additional features.

## License

This project is licensed under the [MIT License](LICENSE).
