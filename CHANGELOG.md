# Changelog

## [0.7.5](https://github.com/cloverdefa/Script/compare/v0.7.4...v0.7.5) (2023-09-08)


### chore

* update video download functionality ([39da4fc](https://github.com/cloverdefa/Script/commit/39da4fc932b9c82b57ba52ffcf64aa7881b891d3))


### Code Refactoring

* update error and success messages for video downloads ([940c614](https://github.com/cloverdefa/Script/commit/940c614137f1befe495b51e2f82e97d039587b9a))

## [0.7.4](https://github.com/cloverdefa/Script/compare/v0.7.3...v0.7.4) (2023-09-08)


### chore

* update completion echo statements ([1a5157a](https://github.com/cloverdefa/Script/commit/1a5157aee0c69e612fca7f95a23167326fdbb461))

## [0.7.3](https://github.com/cloverdefa/Script/compare/v0.7.2...v0.7.3) (2023-09-08)


### Code Refactoring

* modify script to handle long file names and improve error handling ([41cbc73](https://github.com/cloverdefa/Script/commit/41cbc734666347911b3813e03bc65ec2376b5b01))

## [0.7.2](https://github.com/cloverdefa/Script/compare/v0.7.1...v0.7.2) (2023-09-08)


### chore

* refactor update commands and add error handling ([8e9cd94](https://github.com/cloverdefa/Script/commit/8e9cd94b7751a26a09aaf54efb7ff19523f39536))
* update command to use variable arguments ([991d823](https://github.com/cloverdefa/Script/commit/991d8239ce63c308957e3c5f64dd9060b54f176e))
* update message for VE host ([a567a8c](https://github.com/cloverdefa/Script/commit/a567a8c93ed24350002356c0554ccb262eaacdab))


### Code Refactoring

* refactor Update-VM function and error message formatting ([b915172](https://github.com/cloverdefa/Script/commit/b9151725707ac270b5e3d1b612d3de3fc177f93e))
* update command in Update-VM function to use 'update-vm' in ssh call ([caf0b6a](https://github.com/cloverdefa/Script/commit/caf0b6a53455e2fb6afdf8540518a21e6d5b9322))

## [0.7.1](https://github.com/cloverdefa/Script/compare/v0.7.0...v0.7.1) (2023-09-08)


### Bug Fixes

* add error message for failed space reading ([77e1db5](https://github.com/cloverdefa/Script/commit/77e1db5f583d132da87bea984d3d3747bb7832e6))


### Code Refactoring

* refactor disk space script for better readability and performance ([5373fbd](https://github.com/cloverdefa/Script/commit/5373fbd778a7b48507368e561724fef077ee02c8))
* refactor Show-df function and improve error handling ([e07bb97](https://github.com/cloverdefa/Script/commit/e07bb9764da130dde59b7289393a27056d9f69d0))

## [0.7.0](https://github.com/cloverdefa/Script/compare/v0.6.46...v0.7.0) (2023-09-08)


### chore

* add exit command at end of file ([4f97f7a](https://github.com/cloverdefa/Script/commit/4f97f7a8f072e0ce27765fad2dac9ddf9b23fd93))


### Features

* refactor capacity information display for servers ([20f26ce](https://github.com/cloverdefa/Script/commit/20f26ce533734130154e43b498ead34e0d40fa99))


### Bug Fixes

* improve error handling and completion messaging for space data reading ([769e64e](https://github.com/cloverdefa/Script/commit/769e64e9cd453ccda0b57983ac0b5aa67a428168))


### Docs

* update output message to include variable value ([82ea4c1](https://github.com/cloverdefa/Script/commit/82ea4c169c55eaf9ef40db4486693a82208bba42))


### Code Refactoring

* improve command execution and error messaging ([8429a91](https://github.com/cloverdefa/Script/commit/8429a9131168f3be45bbd39f8286492a62c37c7a))

## [0.6.46](https://github.com/cloverdefa/Script/compare/v0.6.45...v0.6.46) (2023-09-08)


### Code Refactoring

* refactor code and update Git pull script ([fa263e3](https://github.com/cloverdefa/Script/commit/fa263e3562ef1f3aab38b3af2ab5bb5655f1af6c))

## [0.6.45](https://github.com/cloverdefa/Script/compare/v0.6.44...v0.6.45) (2023-09-08)


### chore

* refactor Git-Pull-Repo commands ([5772248](https://github.com/cloverdefa/Script/commit/5772248ca55aab81a6058e95aab0941c4d7605dc))


### Docs

* fix typo in if statement ([a6f4495](https://github.com/cloverdefa/Script/commit/a6f4495317169517a58c1268ae4b1c9d0eaa606f))


### Code Refactoring

* change conditional statement to use square brackets ([abf2025](https://github.com/cloverdefa/Script/commit/abf2025a6a96fad67be3b23f4aa4bd2205530247))
* refactor function arguments and remove unnecessary parentheses ([e9e25f3](https://github.com/cloverdefa/Script/commit/e9e25f3f09cd32848d1456f4200bd11b1f303fc1))
* refactor Git-Pull-Repo function and remove unnecessary echo statements ([2e8681c](https://github.com/cloverdefa/Script/commit/2e8681c8a95b900b7005d8d49157132456c3edf1))
* refactor Git-Pull-Repo function to accept repository name as argument ([bb9d77f](https://github.com/cloverdefa/Script/commit/bb9d77fd49afc143ba79e16cb770ce96e50c921a))

## [0.6.44](https://github.com/cloverdefa/Script/compare/v0.6.43...v0.6.44) (2023-09-08)


### Code Refactoring

* refactor script to improve readability and consistency ([156c74d](https://github.com/cloverdefa/Script/commit/156c74d8dd27e2f01af51d3743b1bd2dab215a26))

## [0.6.43](https://github.com/cloverdefa/Script/compare/v0.6.42...v0.6.43) (2023-09-08)


### chore

* update condition for `$method` from 'nothing' to 'Exit 0' ([abcb8ac](https://github.com/cloverdefa/Script/commit/abcb8ac7cce8aa9440769ff53758225ed4a7354f))

## [0.6.42](https://github.com/cloverdefa/Script/compare/v0.6.41...v0.6.42) (2023-09-08)


### Code Refactoring

* refactor function names and remove print statements ([43ceaa1](https://github.com/cloverdefa/Script/commit/43ceaa1f3d2252dbff2abed25f136269ed2e6c17))

## [0.6.41](https://github.com/cloverdefa/Script/compare/v0.6.40...v0.6.41) (2023-09-08)


### Code Refactoring

* change condition for if statement to use specific method ([073e220](https://github.com/cloverdefa/Script/commit/073e2207c6db7332b00b9a9dbdcbeb1b22133bdf))
* refactor Get-Update function to support multiple repositories ([9c00324](https://github.com/cloverdefa/Script/commit/9c003241e30bddea7fbbbb21732f601434a3042d))

## [0.6.40](https://github.com/cloverdefa/Script/compare/v0.6.39...v0.6.40) (2023-09-08)


### Bug Fixes

* update error message for git pull operation ([7fdc8d7](https://github.com/cloverdefa/Script/commit/7fdc8d78db4ee9ac4b8cefd234fb693f77bf11f2))

## [0.6.39](https://github.com/cloverdefa/Script/compare/v0.6.38...v0.6.39) (2023-09-08)


### Docs

* update git pull messages ([cde70f8](https://github.com/cloverdefa/Script/commit/cde70f8f7273964445194e8da045238a6eadc4e5))

## [0.6.38](https://github.com/cloverdefa/Script/compare/v0.6.37...v0.6.38) (2023-09-08)


### Code Refactoring

* simplify shell script by removing unnecessary statements ([67bd0b5](https://github.com/cloverdefa/Script/commit/67bd0b50514ab321e936b13f04997cca91f88554))

## [0.6.37](https://github.com/cloverdefa/Script/compare/v0.6.36...v0.6.37) (2023-09-08)


### Bug Fixes

* fix error message when pulling remote data ([83734f3](https://github.com/cloverdefa/Script/commit/83734f34549e50301d3e5b3d0bf2d8a4eab9c14d))

## [0.6.36](https://github.com/cloverdefa/Script/compare/v0.6.35...v0.6.36) (2023-09-08)


### Docs

* fix typo in git-pull-wsl.sh script ([b462b2d](https://github.com/cloverdefa/Script/commit/b462b2dffce6e422a062ffe0d380bc742dc68c7e))

## [0.6.35](https://github.com/cloverdefa/Script/compare/v0.6.34...v0.6.35) (2023-09-08)


### chore

* remove debug flag from script ([650d918](https://github.com/cloverdefa/Script/commit/650d9188e966de0ec9c642a4e1aa6c57153503ff))

## [0.6.34](https://github.com/cloverdefa/Script/compare/v0.6.33...v0.6.34) (2023-09-08)


### Styling

* update script to use double quotes in if statements ([5f720b0](https://github.com/cloverdefa/Script/commit/5f720b0ab37026b1a9e5692408d45debde48c1d5))


### Code Refactoring

* improve numeric exit code comparison ([2eb300e](https://github.com/cloverdefa/Script/commit/2eb300e628bf4a3fdcfcdb03ef7e037e854c9630))
* refactor and improve the `git-pull-wsl.sh` script ([7b817fd](https://github.com/cloverdefa/Script/commit/7b817fdc7102d0b5db1fa906af5d9c0d0375e430))

## [0.6.33](https://github.com/cloverdefa/Script/compare/v0.6.32...v0.6.33) (2023-09-08)


### Code Refactoring

* refactor code for better readability and remove unnecessary blocks ([5c96c6c](https://github.com/cloverdefa/Script/commit/5c96c6c43c72d622a786470cf1b16f035af9e188))

## [0.6.32](https://github.com/cloverdefa/Script/compare/v0.6.31...v0.6.32) (2023-09-08)


### chore

* update file headers and shebang lines ([dad2f9a](https://github.com/cloverdefa/Script/commit/dad2f9af8810b0a0f1c02dc2aea15e46c1241940))

## [0.6.31](https://github.com/cloverdefa/Script/compare/v0.6.30...v0.6.31) (2023-09-08)


### chore

* update shebangs in shell and PowerShell scripts ([a94357d](https://github.com/cloverdefa/Script/commit/a94357d12b1f5ddc312c6afcce46d545e0b64c79))

## [0.6.30](https://github.com/cloverdefa/Script/compare/v0.6.29...v0.6.30) (2023-09-08)


### chore

* update git-pull scripts for cross-platform compatibility ([8705b2a](https://github.com/cloverdefa/Script/commit/8705b2af76121e583ccf3a6152b9360bd2e2d7e8))

## [0.6.29](https://github.com/cloverdefa/Script/compare/v0.6.28...v0.6.29) (2023-09-07)


### chore

* remove unnecessary git pull commands from script files ([cb11c50](https://github.com/cloverdefa/Script/commit/cb11c50f1b1ed3e2468e428d1200fce708512714))

## [0.6.28](https://github.com/cloverdefa/Script/compare/v0.6.27...v0.6.28) (2023-09-04)


### Build System

* update posh-linux-amd64 binary file ([e6b4255](https://github.com/cloverdefa/Script/commit/e6b4255bec802b3115fc07d2bc8215c0877a959b))

## [0.6.27](https://github.com/cloverdefa/Script/compare/v0.6.26...v0.6.27) (2023-09-04)


### chore

* change file mode of `posh-linux-amd64` to 755 ([8b35e2b](https://github.com/cloverdefa/Script/commit/8b35e2b817facfd218b11d45d663e5c34fec1e5f))

## [0.6.26](https://github.com/cloverdefa/Script/compare/v0.6.25...v0.6.26) (2023-09-04)


### chore

* increase functionality of `posh-linux-amd64` ([bd4ea6c](https://github.com/cloverdefa/Script/commit/bd4ea6ca3b9ce5b63a30b97f1a089ac7e68b7f25))

## [0.6.25](https://github.com/cloverdefa/Script/compare/v0.6.24...v0.6.25) (2023-09-04)


### chore

* ignore `pyproject.toml` and `poetry.lock` files in `.gitignore` ([0bbd524](https://github.com/cloverdefa/Script/commit/0bbd524e727de211bcafb3bb936a8a3707ed5829))

## [0.6.24](https://github.com/cloverdefa/Script/compare/v0.6.23...v0.6.24) (2023-09-03)


### chore

* rename and change file mode for posh-linux-arm64 ([a1c83fb](https://github.com/cloverdefa/Script/commit/a1c83fbce0ad0fe8ad6c14de0780f87387549eed))

## [0.6.23](https://github.com/cloverdefa/Script/compare/v0.6.22...v0.6.23) (2023-09-02)


### chore

* rename `posh-linux-amd64` to `posh-linux-arm64` ([5cee9c5](https://github.com/cloverdefa/Script/commit/5cee9c5f1e3566fef01d34e7344dd7fd055da03a))

## [0.6.22](https://github.com/cloverdefa/Script/compare/v0.6.21...v0.6.22) (2023-09-02)


### Styling

* add blank line at end of file ([54be69b](https://github.com/cloverdefa/Script/commit/54be69b0f692de6c7d5064adfbaf00c4e79805f8))

## [0.6.21](https://github.com/cloverdefa/Script/compare/v0.6.20...v0.6.21) (2023-09-02)


### chore

* update file paths for git-pull scripts ([0ddf69b](https://github.com/cloverdefa/Script/commit/0ddf69b9826b22e1089203b0982557ad4d26a8d6))

## [0.6.20](https://github.com/cloverdefa/Script/compare/v0.6.19...v0.6.20) (2023-08-31)


### chore

* add new file `posh-linux-amd64` ([bdc98aa](https://github.com/cloverdefa/Script/commit/bdc98aa6c27e9397bb6f2b7955c651461535192d))

## [0.6.19](https://github.com/cloverdefa/Script/compare/v0.6.18...v0.6.19) (2023-08-27)


### chore

* ignore specific files and folders ([bea5769](https://github.com/cloverdefa/Script/commit/bea57698f0801f48ad013b175fad84fec85454da))

## [0.6.18](https://github.com/cloverdefa/Script/compare/v0.6.17...v0.6.18) (2023-08-26)


### chore

* add .gitignore file ([455478a](https://github.com/cloverdefa/Script/commit/455478a32de7df6c36c5f6c569c2c9b3086c3d84))

## [0.6.17](https://github.com/cloverdefa/Script/compare/v0.6.16...v0.6.17) (2023-08-26)


### Build System

* update CodeGPT binaries for Linux and Windows ([dd70fda](https://github.com/cloverdefa/Script/commit/dd70fda7c9ca4e1f03ccb0d5b49c55d883d87771))

## [0.6.16](https://github.com/cloverdefa/Script/compare/v0.6.15...v0.6.16) (2023-08-26)


### chore

* ignore specific files and folders for file tracking ([d4f058c](https://github.com/cloverdefa/Script/commit/d4f058c3056173328dfba94e25ae67f80689fb6e))

## [0.6.15](https://github.com/cloverdefa/Script/compare/v0.6.14...v0.6.15) (2023-08-26)


### chore

* remove git pull command for python-adguardhome in relevant scripts ([fccfcb4](https://github.com/cloverdefa/Script/commit/fccfcb47ee6ca97126051cd79ab5094d3fbff925))

## [0.6.14](https://github.com/cloverdefa/Script/compare/v0.6.13...v0.6.14) (2023-08-25)


### chore

* remove unnecessary file ([ce625bb](https://github.com/cloverdefa/Script/commit/ce625bb0ff2221d0c6e3db5b312be956d91a2670))
* remove unnecessary lines from git-pull scripts ([0407057](https://github.com/cloverdefa/Script/commit/0407057bbc05ecf373cc62d2fc68cfe0b0d99eb6))
* update `changelog-types` to include `chore` type in release workflow ([417e732](https://github.com/cloverdefa/Script/commit/417e73222e8f26f2b840f859d7c176d882705905))
* update CodeGPT binary files ([d15cfee](https://github.com/cloverdefa/Script/commit/d15cfee0d18cc930e244fab70edd0cabc09609c8))
* update file paths for `yt-dlp.exe` in PowerShell scripts ([fa28e2b](https://github.com/cloverdefa/Script/commit/fa28e2bd3f297cec729b763c7d0d9a1df0162c68))
* update git-pull script for multiple repositories ([c776026](https://github.com/cloverdefa/Script/commit/c776026be863c15d10e19536960a9d37e372e56a))

## [0.6.13](https://github.com/cloverdefa/Script/compare/v0.6.12...v0.6.13) (2023-08-12)


### Build System

* add support for cygwin1.dll ([895edc6](https://github.com/cloverdefa/Script/commit/895edc617ee78887d1ffd85c5d9fc0be8a0ae550))

## [0.6.12](https://github.com/cloverdefa/Script/compare/v0.6.11...v0.6.12) (2023-08-09)


### Build System

* update CodeGPT executables for multiple platforms ([c4c2b20](https://github.com/cloverdefa/Script/commit/c4c2b207472fd5deabcfd30dfce3fe0ecbf34fde))

## [0.6.11](https://github.com/cloverdefa/Script/compare/v0.6.10...v0.6.11) (2023-08-08)


### Build System

* switch to internal API and add new file for CodeGPT on Linux ([1091bb8](https://github.com/cloverdefa/Script/commit/1091bb8159e8ba949c19453ba29ed2185ecd9c98))

## [0.6.10](https://github.com/cloverdefa/Script/compare/v0.6.9...v0.6.10) (2023-08-05)


### Code Refactoring

* refactor git-pull scripts, removing unnecessary code ([2ef4680](https://github.com/cloverdefa/Script/commit/2ef468016d796cc6c557a3de7d7dae8236d7e5c3))

## [0.6.9](https://github.com/cloverdefa/Script/compare/v0.6.8...v0.6.9) (2023-07-31)


### Build System

* update `CodeGPT-windows-amd64.exe` ([767f949](https://github.com/cloverdefa/Script/commit/767f949b8827bdee80ebebeac3f987f28b792594))

## [0.6.7](https://github.com/cloverdefa/Script/compare/v0.6.6...v0.6.7) (2023-07-21)


### Build System

* add necessary files for Windows compatibility ([9638b25](https://github.com/cloverdefa/Script/commit/9638b255b715a394074de7f9a71727219df2ed3d))

## [0.6.6](https://github.com/cloverdefa/Script/compare/v0.6.5...v0.6.6) (2023-07-12)


### Build System

* add FFmpeg executables ([8cddb1b](https://github.com/cloverdefa/Script/commit/8cddb1b892b216bc698c85f67271c27194a61fa1))

## [0.6.5](https://github.com/cloverdefa/Script/compare/v0.6.4...v0.6.5) (2023-07-02)


### Code Refactoring

* remove code displaying "Happy 2 You 容量空間" section ([ccca615](https://github.com/cloverdefa/Script/commit/ccca615f3165f442dca999bb30b7019a3d4e57dd))

## [0.6.4](https://github.com/cloverdefa/Script/compare/v0.6.3...v0.6.4) (2023-06-28)


### Code Refactoring

* remove echo and ssh commands for updating hosts ([ddefdff](https://github.com/cloverdefa/Script/commit/ddefdff3921b4897892470811d5ebc5df92e5a5c))

## [0.6.3](https://github.com/cloverdefa/Script/compare/v0.6.2...v0.6.3) (2023-06-17)


### Styling

* fix capitalization of "Github" in file paths ([855bc92](https://github.com/cloverdefa/Script/commit/855bc925a7834b1007a0d6fc692665535126574a))

## [0.6.2](https://github.com/cloverdefa/Script/compare/v0.6.1...v0.6.2) (2023-06-17)


### Code Refactoring

* refactor file paths and remove unnecessary exit line ([84e71ee](https://github.com/cloverdefa/Script/commit/84e71ee9c325281c8316864082fd6eec5d98a574))

## [0.6.1](https://github.com/cloverdefa/Script/compare/v0.6.0...v0.6.1) (2023-06-17)


### Code Refactoring

* refactor git-pull and checkout process for consistency ([88fece4](https://github.com/cloverdefa/Script/commit/88fece4c75d60930f12854af4c0711635d69e0a0))

## [0.6.0](https://github.com/cloverdefa/Script/compare/v0.5.1...v0.6.0) (2023-06-17)


### Features

* add PowerShell script for pulling remote data and containers ([c69144e](https://github.com/cloverdefa/Script/commit/c69144ea0a56bfa1daa43242fa8ca7d9b8f62d16))


### Code Refactoring

* optimize PowerShell repository with code cleanup and git pull ([2ee1321](https://github.com/cloverdefa/Script/commit/2ee13217c1f44ac181ad12cba337c9782ed908a8))

## [0.5.1](https://github.com/cloverdefa/Script/compare/v0.5.0...v0.5.1) (2023-06-14)


### Bug Fixes

* fix shebang typo in bash scripts ([01493f6](https://github.com/cloverdefa/Script/commit/01493f6150b4fe836116f59a5e81f7ea40ef6407))

## [0.5.0](https://github.com/cloverdefa/Script/compare/v0.4.0...v0.5.0) (2023-06-09)


### Features

* improve system compatibility and add new executable file ([a3d1fac](https://github.com/cloverdefa/Script/commit/a3d1faca324741b9b787454dc87a97eb0c89d9b3))

## [0.4.0](https://github.com/cloverdefa/Script/compare/v0.3.0...v0.4.0) (2023-06-07)


### Features

* automate fetching remote changes in git-pull.ps1 ([d026792](https://github.com/cloverdefa/Script/commit/d026792f80275be9fc56419ca9e36bd381fea6db))

## [0.3.0](https://github.com/cloverdefa/Script/compare/v0.2.2...v0.3.0) (2023-06-05)


### Features

* add support for monitoring multiple Unifi devices ([88d462a](https://github.com/cloverdefa/Script/commit/88d462a631444b96a405bd4d6d1467d5f179c2f6))

## [0.2.2](https://github.com/cloverdefa/Script/compare/v0.2.1...v0.2.2) (2023-05-25)


### Code Refactoring

* standardize file names for disk usage scripts ([ddbc486](https://github.com/cloverdefa/Script/commit/ddbc486090628c9cc759437cadb6bbf94890fb81))

## [0.2.1](https://github.com/cloverdefa/Script/compare/v0.2.0...v0.2.1) (2023-05-20)


### Build System

* add CodeGPT executable for Windows platform ([517e1c9](https://github.com/cloverdefa/Script/commit/517e1c94cdc62212195aae12f9a99290242c2d1d))

## [0.2.0](https://github.com/cloverdefa/Script/compare/v0.1.2...v0.2.0) (2023-05-15)


### Features

* add SSH command for disk usage display ([9973de2](https://github.com/cloverdefa/Script/commit/9973de2c963be9b5acf4d1a36aa8d0c54646a319))
* add SSH command to display VM disk usage ([e7ebd29](https://github.com/cloverdefa/Script/commit/e7ebd29cbd426d747e2c2b3679521ec5f225265d))

## [0.1.2](https://github.com/cloverdefa/Script/compare/v0.1.1...v0.1.2) (2023-05-12)


### Code Refactoring

* standardize naming conventions and improve clarity ([418d4b2](https://github.com/cloverdefa/Script/commit/418d4b2d5a01bd20852b807b415085922eed321c))
* translate echo messages to Chinese and make file paths absolute ([9db41ca](https://github.com/cloverdefa/Script/commit/9db41cad81ce910ba5cec9e784f3718309f6219e))
* translate output messages and rename default branch ([7a77e3e](https://github.com/cloverdefa/Script/commit/7a77e3ef4b42e759e27b67ae98835d9df616badf))

## [0.1.1](https://github.com/cloverdefa/Script/compare/v0.1.0...v0.1.1) (2023-05-10)


### Docs

* add installation instructions to README.md ([bbb9bcb](https://github.com/cloverdefa/Script/commit/bbb9bcb1483a8f048e9b6b88f532b7030a5c26c8))

## [0.1.0](https://github.com/cloverdefa/Script/compare/0.0.2...v0.1.0) (2023-05-08)


### Features

* add disk space monitoring for IRC servers ([acb62aa](https://github.com/cloverdefa/Script/commit/acb62aaa86eed4beb8a76d11b5ec8a10abc72fd1))


### Code Refactoring

* refactor shell scripts for better performance ([bd49bd9](https://github.com/cloverdefa/Script/commit/bd49bd926886516ff8cb59a11dfc25a84cd07473))
* update Node-01 deployment in SSH command ([ca461cd](https://github.com/cloverdefa/Script/commit/ca461cd2ecf0fba851d7f163538a84a8945d5e08))


### Docs

* update installation instructions in README.md file ([9cb2047](https://github.com/cloverdefa/Script/commit/9cb204774b5d6e45b2cb02f6284be1ecc63b1f13))
