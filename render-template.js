const { readFileSync, writeFile } = require("fs");
const { Liquid } = require("liquidjs");

console.log("Processing template");

const _getAllFilesFromFolder = (dir) => {
  const { readdirSync, statSync } = require("fs");
  let results = [];

  readdirSync(dir).forEach((file) => {
    file = dir + "/" + file;
    const stat = statSync(file);

    if (stat && stat.isDirectory()) {
      results = results.concat(_getAllFilesFromFolder(file));
    } else {
      results.push(file);
    }
  });

  return results;
};

const engine = new Liquid();
const settings = JSON.parse(readFileSync("settings.json"));

const files = _getAllFilesFromFolder(__dirname + "/template");
files.forEach((file) => {
  engine
    .renderFile(file, settings) // will read and render `views/hello.liquid`
    .then((content) => {
      const target = file.replace('tools/template/', '')
      writeFile(target, content, (err) => {
        if (err) {
          console.error(err);
        } else {
          console.log("DONE writing", target)
        }
      });
    });
});
