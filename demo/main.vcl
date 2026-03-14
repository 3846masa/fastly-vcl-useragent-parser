include "useragent-parser.vcl";


sub vcl_recv {
#FASTLY recv
  error 601 "";
}


sub vcl_error {
#FASTLY error
  declare local var.useragent STRING = get_parsed_useragent();
  declare local var.useragent_os STRING = get_useragent_os();
  declare local var.useragent_device STRING = get_useragent_device();

  set obj.status = 200;
  set obj.http.content-type = "application/json";
  set obj.http.cache-control = "no-store";

  set obj.http.User-Agent-Family = subfield(var.useragent, "family");
  set obj.http.User-Agent-Version =
    subfield(var.useragent, "major") "."
    subfield(var.useragent, "minor") "."
    subfield(var.useragent, "patch");

  synthetic {"
{
  "raw": ""} json.escape(req.http.user-agent) {"",
  "useragent": {
    "family": ""} json.escape(subfield(var.useragent, "family")) {"",
    "major": ""} json.escape(subfield(var.useragent, "major")) {"",
    "minor": ""} json.escape(subfield(var.useragent, "minor")) {"",
    "patch": ""} json.escape(subfield(var.useragent, "patch")) {""
  },
  "os": {
    "family": ""} json.escape(subfield(var.useragent_os, "family")) {"",
    "major": ""} json.escape(subfield(var.useragent_os, "major")) {"",
    "minor": ""} json.escape(subfield(var.useragent_os, "minor")) {"",
    "patch": ""} json.escape(subfield(var.useragent_os, "patch")) {"",
    "patchMinor": ""} json.escape(subfield(var.useragent_os, "patchMinor")) {""
  },
  "device": {
    "family": ""} json.escape(subfield(var.useragent_device, "family")) {"",
    "brand": ""} json.escape(subfield(var.useragent_device, "brand")) {"",
    "model": ""} json.escape(subfield(var.useragent_device, "model")) {""
  }
}
  "};

  return(deliver);
}
