# Typesetting Documentation from Markdown Files

A Repository for Generating Multi-Format Documentation from Markdown Files Using Pandoc and PlantUML.

This repository is primarily intended for use by students and staff of the Computer Science Faculty at Titu Maiorescu University, Bucharest, Romania.

## Disclaimer

This repository is provided **as-is**, and users are encouraged to clone and adapt it to their needs.  
Contributions to this repository are accepted via **pull requests** only, except for updates made directly by the maintainer.

## How to Obtain docbuilder

### 1. Clone this repository
To get started, clone this repository into a dedicated directory where you will manage your documentation. We recommend using a folder named `documentation`.

Assuming the following structure, move in the root of your code:
```
.
├── application
│   └── src
├── documentation
```

```bash
git clone https://github.com/lightvision/Markdown_To_Docs_Generator.git documentation
````

### 2. Reset Git history (optional)

If you intend to use this repository as a base for your own project and do not plan to contribute back, you can reset the Git history as follows:

```bash
rm -rf .git
git init
git add .
git commit -m "Initial commit: Adapted docbuilder for my project"
```


## How to Use

To get started with `docbuilder`, follow these steps.

---

### 1. Prerequisites
Before using `docbuilder`, ensure the following:
- **Docker**: Make sure Docker is installed and running on your system. You can verify this by running:
```bash
  docker --version
  docker compose version
```

### 2. Essential Commands
There are two key commands you’ll need to use regularly:

#### Build the Docker Image
Build the docbuilder Docker image before running it. This form is recommended because do not use cache when building the image:
```shell
docker compose build --no-cache
```
Please note: Take a break, tt will take some time to build (~250 seconds on my machine).

#### Run docbuilder
Run the container to access its functionality. Use:
```shell
docker compose run --rm docbuilder
```

When you run this command without any arguments, the default target from the Makefile will display a help message. For details on usage, check the HowTo.md file.


#### Entering into the container
If for some reason you want to enter into container, run the following in order to override the *entrypoint*:
```shell
docker compose run --entrypoint=/bin/bash --rm docbuilder
```