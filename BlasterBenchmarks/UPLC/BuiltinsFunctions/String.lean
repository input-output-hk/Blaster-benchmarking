import PlutusCore.String
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Uplc
import BlasterBenchmarks.UPLC.BuiltinsFunctions.Utils

namespace UPLC.CekValue
namespace PLC
  open PlutusCore.String
  export PlutusCore.String (
    appendString
    equalsString
    encodeUtf8
    decodeUtf8
  )
end PLC
open UPLC.Uplc
open CekValue

-- Define appendString
def appendString (Vs : List CekValue) : Option CekValue :=
  match Vs with
  | [CekValue.VCon (Const.String x), CekValue.VCon (Const.String y)] =>
      some (CekValue.VCon (Const.String (PLC.appendString x y)))
  | _ => none

-- Define equalsString
def equalsString (Vs : List CekValue) : Option CekValue :=
  match Vs with
  | [CekValue.VCon (Const.String x), CekValue.VCon (Const.String y)] =>
      some (CekValue.VCon (Const.Bool (PLC.equalsString x y)))
  | _ => none


-- Define encodeUtf8
def encodeUtf8 (Vs : List CekValue) : Option CekValue :=
  match Vs with
  | [CekValue.VCon (Const.String s)] =>
      some (CekValue.VCon (Const.ByteString (PLC.encodeUtf8 s)))
  | _ => none

-- Define decodeUtf8
def decodeUtf8 (Vs : List CekValue) : Option CekValue :=
  match Vs with
  | [CekValue.VCon (Const.ByteString bs)] =>
      tryCatchSome (PLC.decodeUtf8 bs) (CekValue.VCon ∘ Const.String)
  | _ => none


end UPLC.CekValue
