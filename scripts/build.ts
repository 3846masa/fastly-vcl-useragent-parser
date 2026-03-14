import fs from 'node:fs/promises';

import { Liquid } from 'liquidjs';
import YAML from 'js-yaml';

const regexes = YAML.load(
  await fs.readFile(new URL('../submodules/uap-core/regexes.yaml', import.meta.url), 'utf-8'),
) as object;

const engine = new Liquid();

engine.registerFilter('escape_vcl_regex', (v: string) => v.replace(/"/g, `\\x22`).replace(/%/g, `\\x25`));
engine.registerFilter('to_vcl_replacement', (v: string) => v.replace(/\$([0-9])/g, `"} re.group.$1 {"`));

const template = await fs.readFile(new URL('../templates/useragent-parser.vcl.liquid', import.meta.url), 'utf-8');
const rendered = await engine.parseAndRender(template, regexes);

await fs.writeFile(new URL('../useragent-parser.vcl', import.meta.url), rendered);
