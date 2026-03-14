# Fastly VCL User-Agent parser

[ua-parser/uap-core](https://github.com/ua-parser/uap-core) をもとに Fastly VCL で User-Agent をパースするユーティリティ。

## Usage

- [`useragent-parser.vcl`](./useragent-parser.vcl) をコピーします
- `main.vcl` で include します
  - ```vcl
    include "useragent-parser.vcl";
    ```
- ユーザーエージェントの情報が得たい場合は、`get_parsed_useragent` を呼び出します
  - 返り値は Structure Field Values の Dict 型です、 `subfield` 関数で特定の値を参照できます
  - ```vcl
    declare local var.useragent STRING;
    set var.useragent = get_parsed_useragent();
    set req.http.User-Agent-Family = subfield(var.useragent, "family");
    set req.http.User-Agent-Version =
      subfield(var.useragent, "major") "."
      subfield(var.useragent, "minor") "."
      subfield(var.useragent, "patch");
    ```
- OS の情報が得たい場合は、`get_useragent_os` を呼び出します
  - 返り値は Structure Field Values の Dict 型です、 `subfield` 関数で特定の値を参照できます
  - ```vcl
    declare local var.os STRING;
    set var.os = get_useragent_os();
    set req.http.User-Agent-OS = subfield(var.os, "family");
    ```
- ユーザーエージェントの情報が得たい場合は、`get_useragent_device` を呼び出します
  - 返り値は Structure Field Values の Dict 型です、 `subfield` 関数で特定の値を参照できます
  - ```vcl
    declare local var.device STRING;
    set var.device = get_useragent_device();
    set req.http.User-Agent-Device = subfield(var.device, "family");
    ```

## API

### `get_parsed_useragent`

ユーザーエージェントをパースした結果が得られます。
詳しくは、[ua-parser/uap-core - docs/specification.md - `user_agent_parsers`](https://github.com/ua-parser/uap-core/blob/master/docs/specification.md#user_agent_parsers) を参照してください。

| Key      |                                   |
| :------- | :-------------------------------- |
| `family` | ユーザーエージェント ファミリー名 |
| `major`  | メジャーバージョン                |
| `minor`  | マイナーバージョン                |
| `patch`  | パッチバージョン                  |

### `get_useragent_os`

ユーザーエージェントから推論された OS 情報が得られます。
詳しくは、[ua-parser/uap-core - docs/specification.md - `os_parsers`](https://github.com/ua-parser/uap-core/blob/master/docs/specification.md#os_parsers) を参照してください。

| Key          |                          |
| :----------- | :----------------------- |
| `family`     | OS の一般的な呼称        |
| `major`      | メジャーバージョン       |
| `minor`      | マイナーバージョン       |
| `patch`      | パッチバージョン         |
| `patchMinor` | パッチマイナーバージョン |

### `get_useragent_device`

ユーザーエージェントから推論されたデバイス情報が得られます。
詳しくは、[ua-parser/uap-core - docs/specification.md - `device_parsers`](https://github.com/ua-parser/uap-core/blob/master/docs/specification.md#device_parsers) を参照してください。

| Key      |                        |
| :------- | :--------------------- |
| `family` | デバイスの一般的な呼称 |
| `brand`  | ブランド名             |
| `model`  | モデル名               |

## License

[Apache License 2.0](./LICENSE)
