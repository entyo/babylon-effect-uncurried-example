import Main from "./output/Main";

// https://doc.babylonjs.com/features/npm_support#es6
import * as BABYLON from './node_modules/babylonjs/es6.js';
window["BABYLON"] = BABYLON;

if (module.hot) {
  module.hot.dispose(function () {
    console.log("dispose");
  });

  module.hot.accept(function () {
    console.log("accept");
    document.body.innerHTML = ''
    console.log({
      BABYLON
    });
    Main.main();
  });
}

Main.main();