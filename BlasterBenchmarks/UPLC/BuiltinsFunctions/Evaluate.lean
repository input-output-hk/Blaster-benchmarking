import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Uplc
import BlasterBenchmarks.UPLC.BuiltinsFunctions.Bool
import BlasterBenchmarks.UPLC.BuiltinsFunctions.ByteString
import BlasterBenchmarks.UPLC.BuiltinsFunctions.Data
import BlasterBenchmarks.UPLC.BuiltinsFunctions.Integer
import BlasterBenchmarks.UPLC.BuiltinsFunctions.List
import BlasterBenchmarks.UPLC.BuiltinsFunctions.Trace
import BlasterBenchmarks.UPLC.BuiltinsFunctions.Pair


namespace UPLC.Evaluate
open UPLC.Uplc
open CekValue

-- Evaluate a builtin function based on its type.
def evaluateBuiltinFunction (b : BuiltinFun) : List CekValue → Option CekValue :=
  match b with
  | .AddInteger => addInteger
  | .SubtractInteger => subtractInteger
  | .MultiplyInteger => multiplyInteger
  | .DivideInteger => divideInteger
  | .QuotientInteger => quotientInteger
  | .RemainderInteger => remainderInteger
  | .ModInteger => modInteger
  | .EqualsInteger => equalsInteger
  | .LessThanInteger => lessThanInteger
  | .LessThanEqualsInteger => lessThanEqualsInteger
  | .EqualsByteString => equalsByteString
  | .IfThenElse => ifThenElse
  | .Trace => trace
  | .FstPair => fstPair
  | .SndPair => sndPair
  | .ChooseList => chooseList
  | .MkCons => mkCons
  | .HeadList => headList
  | .TailList => tailList
  | .NullList => nullList
  | .ChooseData => chooseData
  | .ConstrData => constrData
  | .MapData => mapData
  | .ListData => listData
  | .IData => iData
  | .BData => bData
  | .UnConstrData => unConstrData
  | .UnMapData => unMapData
  | .UnListData => unListData
  | .UnIData => unIData
  | .UnBData => unBData
  | .EqualsData => equalsData
  | .MkPairData => mkPairData
  | .MkNilData => mkNilData
  | .MkNilPairData => mkNilPairData
  | _ => fun _ => none

end UPLC.Evaluate
