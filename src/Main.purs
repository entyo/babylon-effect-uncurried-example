module Main where

import Prelude

import Babylon (attachControlToArcRotateCamera, createArcRotateCamera, createEngine, createScene, createSphere, createVector3, runRenderLoop, unsafeSceneRender, unsafeMakeSceneRef)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class.Console (log)
import Graphics.Canvas (getCanvasElementById)
import Math (pi)

main :: Effect Unit
main = do
  element <- getCanvasElementById "container"
  case element of
    Nothing -> log "Canvas(id: container) not found"
    Just canvasElement -> do
      -- デフォルト引数はどうすればよい?
      engine <- createEngine canvasElement false {} false
      scene <- createScene engine
      target <- createVector3 0.0 0.0 5.0
      camera <- createArcRotateCamera "camera" (pi / 2.0) (pi / 2.0) 2.0 target scene true
      attachControlToArcRotateCamera camera canvasElement true true 0.0
      sphere <- createSphere "sphere" {diameter: 2} scene
      unsafeMakeSceneRef scene
      runRenderLoop engine unsafeSceneRender
      log "DONE"