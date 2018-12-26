import Main from "./output/Main";

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