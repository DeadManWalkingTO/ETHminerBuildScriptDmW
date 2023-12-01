# ETHminerBuildScriptDmW
[![Hits](https://hits.sh/github.com/DeadManWalkingTO/ETHminerBuildScriptDmW.svg?style=plastic&label=HitCount)](../../)
[![GitHub release](https://img.shields.io/github/release/DeadManWalkingTO/ETHminerBuildScriptDmW/all.svg)](../../releases/latest)
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../releases/latest)
[![GitHub top language](https://img.shields.io/github/languages/top/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../)
[![GitHub language count](https://img.shields.io/github/languages/count/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../)

[![GitHub last commit](https://img.shields.io/github/last-commit/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../)
[![Github commits (since latest release)](https://img.shields.io/github/commits-since/DeadManWalkingTO/ETHminerBuildScriptDmW/latest.svg)](../../)
[![GitHub stars](https://img.shields.io/github/stars/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../stargazers)
[![GitHub forks](https://img.shields.io/github/forks/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../network)
[![GitHub issues](https://img.shields.io/github/issues/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](../../issues)

[![DMCA Protection](https://img.shields.io/badge/DMCA-Protected-brightgreen.svg)](https://www.dmca.com/Takedowns.aspx?r=m)
[![GitHub license](https://img.shields.io/github/license/DeadManWalkingTO/ETHminerBuildScriptDmW.svg)](./LICENSE)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-ETHminerBuildScriptDmW.svg)](./README.md)

> [ETHminer](https://github.com/ethereum-mining/ethminer) Build Script by [DeadManWalking (DeadManWalkingTO-GitHub)](https://github.com/DeadManWalkingTO)

ETHminerBuildScriptDmW an Auto (Download / Configure / Build) Script for [ETHminer](https://github.com/ethereum-mining/ethminer).

- Available versions
  - Windows version (ETHminerBuildScriptDmW.bat)
  - Linux version (ETHminerBuildScriptDmW.bash)
  - MinGW version (ETHminerBuildScriptDmW.sh) (**Discontinued**)

- Supported Operating System
  - Windows (All versions)
    - Windows (7 / 8 / 10)
    - Windows Server (2008 / 2012 / 2016 / 2019)
  - Linux
    - Any Distribution
    - Any Version
  - Unix
    - Any Distribution and Version compatible with BASH
  
- Supported Architectures:
  - x86
  - x64

## Table of Contents
- [Features](#features)
- [Download](#download)
- [Install](#install)
- [Usage](#usage)
- [Feedback](#feedback)
- [Maintainers](#maintainers)
- [Contribute](#contribute)
- [License](#license)
- [Donations](#donations)
- [Common Issues](#common-issues)

## Features
- Auto Clone (Download) latest Master of Ethminer
- Auto Configure Ethminer
- Auto Build Ethminer
- Display Control Messages
- Auto Remove previous compile folders 
- MinGW Extras
  - Auto Install required packages (MinGW)
  - AutoFix "Git Dashless Error" [#817](https://github.com/ethereum-mining/ethminer/issues/817) issue of Ethminer.

## Download
Download [Last release here.](../../releases/latest)

## Install
Script (No installation required)

Dependencies to build ETHminer are required
* Windows Build (ETHminerBuildScriptDmW.bat)
  * [Git](https://github.com/git-for-windows/git/releases/download/v2.16.2.windows.1/Git-2.16.2-64-bit.exe)
  * [Python](https://www.python.org/ftp/python/3.6.4/python-3.6.4-amd64.exe)
  * [ActivePerl](http://downloads.activestate.com/ActivePerl/releases/5.24.3.2404/ActivePerl-5.24.3.2404-MSWin32-x64-404865.exe)
  * [Cmake](https://cmake.org/files/v3.11/cmake-3.11.0-rc2-win64-x64.msi)
  * [OpenGL](https://www.khronos.org/opengl/wiki/Getting_Started)
  * [NVidia CUDA](https://developer.nvidia.com/cuda-downloads)
  * Build Tools (one of the following)
    * [Microsoft Build Tools 2015](https://www.microsoft.com/en-us/download/details.aspx?id=48159)
    * [Microsoft Visual Studio 2015](https://www.visualstudio.com/vs/older-downloads/)
    * [Microsoft Build Tools 2017](https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2017)
    * [Microsoft Visual Studio 2017](https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2017)
* Linux Build (ETHminerBuildScriptDmW.bash)
  * Git
  * Python
  * Perl
  * Cmake
  * Libraries
    * libleveldb-dev
    * libcurl4-openssl-dev
    * libmicrohttpd-dev
    * libudev-dev
  * [OpenGL](https://www.khronos.org/opengl/wiki/Getting_Started)
  * [NVidia CUDA](https://developer.nvidia.com/cuda-downloads)
* MinGW Build (ETHminerBuildScriptDmW.sh) (**Discontinued**)
  * Auto Install required packages (MinGW)
  * Build Tools (one of the following)
    * [Microsoft Build Tools 2015](https://www.microsoft.com/en-us/download/details.aspx?id=48159)
    * [Microsoft Visual Studio 2015](https://www.visualstudio.com/vs/older-downloads/)
    * [Microsoft Build Tools 2017](https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2017)
    * [Microsoft Visual Studio 2017](https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2017)
* Download [Hunter-Fix-v2 (Fix Windows and MinGW Compile Hunter Errors)](https://mega.nz/#F!GAF20C5Q!-c20bK3NElhaaPgdExhh-A) ([#817](https://github.com/ethereum-mining/ethminer/issues/817) [#1011](https://github.com/ethereum-mining/ethminer/issues/1011) issues of Ethminer)

## Usage
* Download or Clone
* Unzip
* Run Script:
  * Windows version (ETHminerBuildScriptDmW.bat)
  * Linux version (ETHminerBuildScriptDmW.bash)
  * MinGW version (ETHminerBuildScriptDmW.sh)
* That's all

## Feedback
Please inform me for aditional Improvments. [Open an Issue](../../issues).

If you like please give a [GitHub Star](../../stargazers) (it's free!).

## Maintainers
[DeadManWalking (DeadManWalkingTO-GitHub)](https://github.com/DeadManWalkingTO).

## Contribute
Feel free to open an [Issue](../../issues/new) or submit [Pull Requests](../../pulls).

## License
[MIT © DeadManWalking (DeadManWalkingTO-GitHub)](./LICENSE).

## Donations
If you find this usefull please donate something at the following:

Bitcoin Address (BTC):
* 15G2BTErGg3i8zTmLfKYStUKtqDLXz6Jc9

Ethereum Address (ETH):
* 0x0a42cE58f6f42516d8cc7B1831d01d4391F59Ef4

Monero Address (XMR):
* 42q4HmXdsp1XgNCrDmPubL8ndtgG2JBtmZMEn28sB4XtEGHhwYojvB65HXPidByfNUFSzxg6ysQsHUHa3ZSrsKLX5pTkCET

Aeon Address (AEON):
* WmssXd9iiPCjjhfVyqYvPzhBuPKkZ5wkVXP5q8L7aYxfPJG5Z8nLyLJXUzxMeuvna9dCEBAmqBzCRWezF6AQqUS51EDJtjAYL

## Common Issues

#### MinGW version (ETHminerBuildScriptDmW.sh) (Discontinued):
Issue [#1](../../issues/1) | Status: **Discontinued**.
