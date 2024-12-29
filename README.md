# Typesetting Documentation from Markdown Files

A Repository for Generating Multi-Format Documentation from Markdown Files Using Pandoc and PlantUML.

This repository is primarily intended for use by students and staff of the Computer Science Faculty at Titu Maiorescu University, Bucharest, Romania.

## Disclaimer

This repository is provided **as-is**, and users are encouraged to clone and adapt it to their needs.  
Contributions to this repository are accepted via **pull requests** only, except for updates made directly by the maintainer.

## Usage as a Sub-Repository

To include this repository as a submodule in your project, follow next steps.
I will assume that you will clone the repository into `documentation` folder inside your bigger project.
You may however name it as you want, just update your directory name in the clone step.

1. Add this repository as a submodule in your project:
   ```bash
   git submodule add https://github.com/lightvision/Markdown_To_Docs_Generator.git documentation
   git submodule update --init --recursive
   git add .gitmodules documentation
   git commit -m "Added documentation submodule"
   ```
2. Push your project to your remote repository:
   ```
   git push
   ```
3. If you want to synchronize your submodule with updates from the original repository:
   ```
   git pull origin main
git submodule update --remote
```
