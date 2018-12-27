const BABYLON = require('babylonjs/babylon');

exports._createEngine = function (canvas, antialias, options, adaptToDeviceRatio) {
  return function () {
    return new BABYLON.Engine(canvas, antialias, options, adaptToDeviceRatio)
  }
};

exports._createScene = function (engine) {
  return function () {
    return new BABYLON.Scene(engine)
  };
};

exports._createArcRotateCamera = function (name, alpha, beta, radius, target, scene, setActiveOnSceneIfNoneActive) {
  return function () {
    return new BABYLON.ArcRotateCamera(name, alpha, beta, radius, target, scene, setActiveOnSceneIfNoneActive);
  }
}

exports._attachControlToArcRotateCamera = function (arcRotateCamera, element, noPreventDefault, useCtrlForPanning, panningMouseButton) {
  arcRotateCamera.attachControl(element, noPreventDefault, useCtrlForPanning, panningMouseButton);
}

exports._createSphere = function (name, options, scene) {
  return function () {
    return BABYLON.MeshBuilder.CreateSphere(name, options, scene);
  }
}

exports._runRenderLoop = function (engine, callback) {
  engine.runRenderLoop(callback);
}

exports._unsafeMakeSceneRef = function (scene) {
  window["scene"] = scene;
}

exports._unsafeSceneRender = function () {
  // Danger!!! It may cause "Uncaught ReferenceError: scene is not defined"
  window["scene"].render();
}

exports._createVector3 = function (x, y, z) {
  return function () {
    return new BABYLON.Vector3(x, y, z);
  }
}

exports._unsafeMakeEngineRef = function (engine) {
  window["engine"] = engine;
}

exports._unsafeWindowResizeEventHandler = function (event) {
  window["engine"].resize();
}

// TODO: addEventListener("resize", callback)