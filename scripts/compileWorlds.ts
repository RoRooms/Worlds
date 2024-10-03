import { readdir } from "node:fs/promises";

const worldFiles = await readdir("./worlds");

let worlds = {};

for (let index = 0; index < worldFiles.length; index++) {
  const fullName = worldFiles[index];
  const splitName = fullName.split(".");
  const placeId = splitName[0];
  const extension = splitName[1];

  if (extension == "json") {
    const worldFile = await Bun.file(`./worlds/${fullName}`);
    const world = await worldFile.json();

    if (typeof world == "object") {
      worlds[placeId] = world;
    }
  }
}

Bun.write("./worlds.json", JSON.stringify(worlds));
