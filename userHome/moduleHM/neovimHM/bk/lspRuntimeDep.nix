{ config, lib, inputs, ... }:
let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];
  config = {
    nixCats = {
      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
        lspsAndRuntimeDeps = {
          cs = with pkgs.vimPlugins; [
            prettier                       # Formatter for CSS, JS                   # https://github.com/prettier/prettier
            rustywind                       # Sorts TailwindCSS classes               # https://github.com/wilfredinni/rustywind
            stylelint                       # Linter for CSS/SCSS                     # https://github.com/stylelint/stylelint
            tailwindcss-language-server     # TailwindCSS LSP                         # https://github.com/tailwindlabs/tailwindcss-intellisense
          ];
         
          go = with pkgs.vimPlugins; [
                gopls                            # Go LSP                                  # https://github.com/golang/tools
                golangci-lint                   # Aggregate Go linters                     # https://github.com/golangci/golangci-lint
                golint                          # Go linter                                # https://github.com/golang/lint
          ];
         
          he = with pkgs.vimPlugins; [
                htmllint                         # HTML linter                              # https://github.com/htmllint/htmllint
                htmx-lsp                         # LSP for htmx                             # https://github.com/yaniswang/htmx-lsp
                rubyPackages_3_4.htmlbeautifier  # HTML formatter                           # https://github.com/beautify-web/html-beautifier
                vscode-langservers-extracted     # HTML/CSS/JS LSPs                         # https://github.com/microsoft/vscode-langservers-extracted
                w3c-validator                     # HTML validation                           # https://github.com/w3c/validator
          ];
         
          jy = with pkgs.vimPlugins; [
                json-languageserver              # JSON LSP                                 # https://github.com/angelozerr/json-languageserver
                jsonlint                         # JSON validator/linter                     # https://github.com/igorshubovych/markdownlint-cli
                yamllint                         # YAML linter                               # https://github.com/adrienverge/yamllint
                yaml-language-server             # YAML LSP                                  # https://github.com/redhat-developer/yaml-language-server
          ];
         
          md = with pkgs.vimPlugins; [
                markdownlint                     # Markdown linter                           # https://github.com/markdownlint/markdownlint
                prettier                         # Markdown formatter                        # https://github.com/prettier/prettier
          ];
         
          nx = with pkgs.vimPlugins; [
                alejandra                         # Nix formatter                             # https://github.com/lnl7/alejandra
                nixd                               # Nix daemon for LSP integration           # https://github.com/nix-community/nix-d
                nixpkgs-fmt                        # Nix code formatter                        # https://github.com/nix-community/nixpkgs-fmt
          ];
         
          rs = with pkgs.vimPlugins; [
                clippy                            # Rust linter                               # https://github.com/rust-lang/rust-clippy
                rust-analyzer                     # Rust LSP                                  # https://github.com/rust-analyzer/rust-analyzer
                rustfmt                           # Rust formatter                             # https://github.com/rust-lang/rustfmt
          ];
         
          ts = with pkgs.vimPlugins; [
                eslint                            # JS/TS linter                              # https://github.com/eslint/eslint
                eslint-plugin-import              # Helps detect invalid imports             # https://github.com/import-js/eslint-plugin-import
                eslint-plugin-jsx-a11y            # Accessibility linting for JSX            # https://github.com/jsx-eslint/eslint-plugin-jsx-a11y
                eslint-plugin-react               # React-specific linting                    # https://github.com/jsx-eslint/eslint-plugin-react
                eslint-plugin-react-hooks         # React hooks linting                       # https://github.com/facebook/react/tree/main/packages/eslint-plugin-react-hooks
                graphql-language-service-cli      # GraphQL LSP/CLI support                    # https://github.com/graphql/graphiql/tree/main/packages/graphql-language-service-cli
                nestjs-language-server            # NestJS LSP                                 # https://github.com/nestjs/nest-ls
                prettier                          # Code formatter                             # https://github.com/prettier/prettier
                prettier-plugin-tailwindcss       # Sort Tailwind classes automatically       # https://github.com/tailwindlabs/prettier-plugin-tailwindcss
                tailwindcss-language-server       # TailwindCSS LSP                            # https://github.com/tailwindlabs/tailwindcss-intellisense
                ts-node                            # Run TypeScript directly                   # https://github.com/TypeStrong/ts-node
                typescript-language-server        # TypeScript LSP                             # https://github.com/typescript-language-server/typescript-language-server
          ];
        };
      });
    };
  };
}
