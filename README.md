- custom.Dockerfile
  - Creates a node image with chrome headless installation for angular testing during builds
  - Make sure to include below changes in karam.conf.js and protractor.conf.js

karma.conf.js

```
// Karma configuration file, see link for more information
// https://karma-runner.github.io/1.0/config/configuration-file.html

module.exports = function (config) {
  config.set({
    ...
    customLaunchers: {
      ChromeHeadless: {
        base: "Chrome",
        flags: [
          "--headless",
          "--disable-gpu",
          "--no-sandbox",
          "--remote-debugging-port=9222",
        ],
      },
    },
    ...
  });
};

```

protractor.conf.js

```
// @ts-check
// Protractor configuration file, see link for more information
// https://github.com/angular/protractor/blob/master/lib/config.ts

const { SpecReporter } = require("jasmine-spec-reporter");

/**
 * @type { import("protractor").Config }
 */
exports.config = {
  ...
  capabilities: {
    browserName: "chrome",
    chromeOptions: {
      args: ["--no-sandbox", "--headless", "--window-size=1024,768"],
    },
  },
  ...
};

```
