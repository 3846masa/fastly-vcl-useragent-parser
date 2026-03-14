# Fastly VCL User-Agent parser

A utility for parsing User-Agent strings in Fastly VCL, based on [ua-parser/uap-core](https://github.com/ua-parser/uap-core).

## Usage

- Copy [`useragent-parser.vcl`](./useragent-parser.vcl)
- Include it in your `main.vcl`
  - ```vcl
    include "useragent-parser.vcl";
    ```
- To get user-agent information, call `get_parsed_useragent`
  - The return value is a Dict type of Structure Field Values; use the `subfield` function to retrieve specific values
  - ```vcl
    declare local var.useragent STRING;
    set var.useragent = get_parsed_useragent();
    set req.http.User-Agent-Family = subfield(var.useragent, "family");
    set req.http.User-Agent-Version =
      subfield(var.useragent, "major") "."
      subfield(var.useragent, "minor") "."
      subfield(var.useragent, "patch");
    ```
- To get OS information, call `get_useragent_os`
  - The return value is a Dict type of Structure Field Values; use the `subfield` function to retrieve specific values
  - ```vcl
    declare local var.os STRING;
    set var.os = get_useragent_os();
    set req.http.User-Agent-OS = subfield(var.os, "family");
    ```
- To get device information, call `get_useragent_device`
  - The return value is a Dict type of Structure Field Values; use the `subfield` function to retrieve specific values
  - ```vcl
    declare local var.device STRING;
    set var.device = get_useragent_device();
    set req.http.User-Agent-Device = subfield(var.device, "family");
    ```

## API

### `get_parsed_useragent`

Returns the parsed user-agent result.
For details, see [ua-parser/uap-core - docs/specification.md - `user_agent_parsers`](https://github.com/ua-parser/uap-core/blob/master/docs/specification.md#user_agent_parsers).

| Key      |                          |
| :------- | :----------------------- |
| `family` | User-agent family name   |
| `major`  | Major version            |
| `minor`  | Minor version            |
| `patch`  | Patch version            |

### `get_useragent_os`

Returns OS information inferred from the user-agent.
For details, see [ua-parser/uap-core - docs/specification.md - `os_parsers`](https://github.com/ua-parser/uap-core/blob/master/docs/specification.md#os_parsers).

| Key          |                          |
| :----------- | :----------------------- |
| `family`     | Common name of the OS    |
| `major`      | Major version            |
| `minor`      | Minor version            |
| `patch`      | Patch version            |
| `patchMinor` | Patch minor version      |

### `get_useragent_device`

Returns device information inferred from the user-agent.
For details, see [ua-parser/uap-core - docs/specification.md - `device_parsers`](https://github.com/ua-parser/uap-core/blob/master/docs/specification.md#device_parsers).

| Key      |                          |
| :------- | :----------------------- |
| `family` | Common name of the device |
| `brand`  | Brand name               |
| `model`  | Model name               |

## License

[Apache License 2.0](./LICENSE)
