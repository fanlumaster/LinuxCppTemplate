# About

This is a template for C++ in Arch Linux.

I use the tool chains below:

- CMake
- Fish
- Neovim
- clangd

Notice that, you should replace the line in the `.clangd` file below to your own include path of this project,

```
"-I/home/sonnycalcr/EDisk/TemplateCodes/LinuxCppTemplate/includes", # you should replace this to your own include path of this project
```

Besides, after cloning this repo to your local device, you need to execute an additional command,

```sh
chmod +x *.sh
```

Moreover, if you use VSCode, do not forget to change "program" name in .vscode/launch.jsonc to your own binary program name.

Then, have fun writting C++ in Linux.


