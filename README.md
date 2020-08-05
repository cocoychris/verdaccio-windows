# 這是 verdaccio-windows 的 Andrash 客製化版本
- 此客製化版本，專門用於 Andrash-AutomationKit。
- 主要的差異是增加了「default_data」目錄，及「apply_default_user_data.bat」檔案。

## 增加的檔案及用途
- 「default_data」目錄：此目錄中包含了 verdaccio-windows 啟動時所需要的設定檔預設範本，如： config.yaml。
- 「apply_default_user_data.bat」檔案：執行此檔案可自動套用預設設定檔。會將 default_data 中的所有檔案複製到 user_data 目錄中
- 「user_data」目錄：此目錄中包含了 verdaccio-windows 啟動時所需要的設定檔們。其中的 storage 目錄裝載了所有已被上傳到伺服器的套件。若此目錄不存在，可執行 apply_default_user_data.bat 來套用 default_data 中的檔案。

## 特別注意
- verdaccio-windows 必須先經過安裝程序才可被啟動使用，安裝時必須傳入參數指定所要使用的設定檔，此時就可傳入「user_data/config.yaml」作為設定檔。詳情請參考下面的 Installation 章節。 

**以下為 verdaccio-windows 的原始說明檔，請參考這些內容來學習如何操作 verdaccio-windows**
===

# verdaccio-windows

[Verdaccio](https://verdaccio.org/) is very useful server that provides "A lightweight private npm proxy registry".

This package allows the installation and running of Verdaccio as a Windows Service.

## Installation

1. Install nodejs for windows.
2. Download the release zip file and uzip to an install location.
3. Change to the install location and run `npm install --production`.
4. Create a [verdaccio configuration file](https://verdaccio.org/docs/en/configuration) to configure your verdaccio installation.
5. Use the service [install](#install) command with the -c flag to point to your config file.  
`node service.js install -c path\to\verdaccio-config.yaml`
6. Use the service [start](#start) command to start your service.

### Installation Notes

Windows firewall may need to be configured to allow the node process act as a server.

#### Customizing the service name

Use can the --name -n option to customize the windows service name. See the [install](#install) command for more service configuration options.

#### Running verdaccio from the command line

Use the runner script with the `-c` option:  
`node runner.js -c path\to\verdaccio-config.yaml`  
This is useful to see the verdaccio's output for any errors.

#### Default Logs

When the service is created the install location will have a `daemon` sub directory. By default the service logs verdaccio standard output and error to this folder. This location can be changed using the service.js [install](#install)'s `--logs` option.  
**NOTE** By default verdaccio logs all http requests, so the log files can get very large. To address this use the [verdaccio configuration file](https://verdaccio.org/docs/en/configuration) to setup [logging](https://verdaccio.org/docs/en/logger).

#### Accounts

As Verdaccio uses apache htpasswd files for its authetication by default. The [htpasswd](https://github.com/http-auth/htpasswd) script is included to ease setup. To use change directory to the install location then run `npm run htpasswd`  
Use this to create a htpasswd file and manage the accounts in it. **NOTE** Ensure Verdaccio is configured to point to the htpasswd file you created.

## Usage

Use the service.js command to manage a verdaccio service.

Use `node service.js help` for more information.

Use `node service.js <command> --help` for information on a specific command.

```text
Manages Verdaccio Services

Usage:
service.js <command> [options]

Commands:
  service.js install    installs the service
  service.js uninstall  uninstalls the service
  service.js start      starts the service
  service.js stop       stops the service
  service.js restart    restarts the service

Options:
  --help      Show help                                                [boolean]
  --version   Show version number                                      [boolean]
  --name, -n  The name to use for the service    [string] [default: "Verdaccio"]
```

### Install

```text
service.js install

installs the service

Options:
  --help              Show help                                        [boolean]
  --version           Show version number                              [boolean]
  --name, -n          The name to use for the service
                                                 [string] [default: "Verdaccio"]
  --config, -c        The path to the verdaccio configuration file      [string]
  --description, -d   The description of the service
                                [string] [default: "Verdaccio Package Registry"]
  --logs              The directory to log the service output
  --account           The account to run the service as
  --account.name      account name
  --account.password  The password for the account.
  --account.domain    The domain of the account
```

### Uninstall

```text
service.js uninstall

uninstalls the service

Options:
  --help      Show help                                                [boolean]
  --version   Show version number                                      [boolean]
  --name, -n  The name to use for the service    [string] [default: "Verdaccio"]
```

### Start

```text
service.js start

starts the service

Options:
  --help      Show help                                                [boolean]
  --version   Show version number                                      [boolean]
  --name, -n  The name to use for the service    [string] [default: "Verdaccio"]
```

### Stop

```text
service.js stop

stops the service

Options:
  --help      Show help                                                [boolean]
  --version   Show version number                                      [boolean]
  --name, -n  The name to use for the service    [string] [default: "Verdaccio"]
```

### Restart

```text
service.js restart

restarts the service

Options:
  --help      Show help                                                [boolean]
  --version   Show version number                                      [boolean]
  --name, -n  The name to use for the service    [string] [default: "Verdaccio"]
```
