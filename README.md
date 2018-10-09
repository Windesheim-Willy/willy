# Willy
This repository is the main repostitory of Willy. All the different components
of Willy are connected in one Docker network inside this repository.

For the configuration of Willy this repository is required.

For more information, check out the ROS master wiki [Wiki](https://windesheim-willy.github.io/WillyWiki)

## Git
[Documentation about git submodules](https://git-scm.com/book/nl/v2/Git-Tools-Submodules)

### Add new sub module

```
git submodule add <GIT URL> <FOLDER NAME>
```

### Keep submodules up-to-date

When updating submodules for the first time, use:

	git submodule update --init --recursive

When updating the current submodule branches, use:

	git submodule update --recursive

When updating all submodules with the latest commits on the supermodule, use:

	git submodule update --recursive --remote

