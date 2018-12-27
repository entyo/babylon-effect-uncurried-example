module Babylon where

import Prelude

import Data.Function.Uncurried (runFn3)
import Data.Function.Uncurried as FU
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn5, mkEffectFn1, runEffectFn1, runEffectFn2, runEffectFn5)
import Graphics.Canvas (CanvasElement)
import Web.Event.Internal.Types (Event)

foreign import data Engine :: Type
foreign import data Scene :: Type
foreign import data ArcRotateCamera :: Type
foreign import data Vector3 :: Type
foreign import data Mesh :: Type

foreign import _createEngine :: forall options. FU.Fn4 CanvasElement Boolean options Boolean (Effect Engine)

-- TODO: newtype
createEngine :: forall option. CanvasElement -> Boolean -> option -> Boolean -> (Effect Engine)
createEngine = FU.runFn4 _createEngine

foreign import _createScene :: FU.Fn1 Engine (Effect Scene)

createScene :: Engine -> (Effect Scene)
createScene = FU.runFn1 _createScene

foreign import _createArcRotateCamera :: FU.Fn7 String Number Number Number Vector3 Scene Boolean (Effect ArcRotateCamera)

-- TODO: newtype
createArcRotateCamera :: String -> Number -> Number -> Number -> Vector3 -> Scene -> Boolean -> (Effect ArcRotateCamera)
createArcRotateCamera = FU.runFn7 _createArcRotateCamera

foreign import _attachControlToArcRotateCamera :: EffectFn5 ArcRotateCamera CanvasElement Boolean Boolean Number Unit

attachControlToArcRotateCamera :: ArcRotateCamera -> CanvasElement -> Boolean -> Boolean -> Number -> (Effect Unit)
attachControlToArcRotateCamera = runEffectFn5 _attachControlToArcRotateCamera

foreign import _createSphere :: forall options. FU.Fn3 String options Scene (Effect Mesh)

createSphere :: forall options. String -> options -> Scene -> (Effect Mesh)
createSphere = runFn3 _createSphere

foreign import _runRenderLoop :: EffectFn2 Engine (EffectFn1 Void Unit) Unit

runRenderLoop :: Engine -> (Void -> Effect Unit) -> Effect Unit
runRenderLoop engine callback = runEffectFn2 _runRenderLoop engine (mkEffectFn1 callback)

foreign import _unsafeSceneRender :: EffectFn1 Void Unit

unsafeSceneRender :: Void -> Effect Unit
unsafeSceneRender = runEffectFn1 _unsafeSceneRender

foreign import _createVector3 :: FU.Fn3 Number Number Number (Effect Vector3)

createVector3 :: Number -> Number -> Number -> (Effect Vector3)
createVector3 = runFn3 _createVector3

foreign import _unsafeMakeSceneRef :: EffectFn1 Scene Unit

unsafeMakeSceneRef :: Scene -> Effect Unit
unsafeMakeSceneRef = runEffectFn1 _unsafeMakeSceneRef

foreign import _unsafeMakeEngineRef :: EffectFn1 Engine Unit

unsafeMakeEngineRef :: Engine -> Effect Unit
unsafeMakeEngineRef = runEffectFn1 _unsafeMakeEngineRef

foreign import _unsafeWindowResizeEventHandler :: EffectFn1 Event Unit

unsafeWindowResizeEventHandler :: Event -> Effect Unit
unsafeWindowResizeEventHandler = runEffectFn1 _unsafeWindowResizeEventHandler

-- TODO: addEventListener("resize", callback)