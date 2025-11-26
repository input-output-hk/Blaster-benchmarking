import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Syntax


namespace Tests.Uplc.AlwaysError
open UPLC.CekMachine
open UPLC.Uplc

def alwaysError : Program :=
  Program.Program (Version.Version 1 1 0) (Term.Error)

set_option warn.sorry false
theorem alwaysError_isErrorState : ∀ (x : Nat), isErrorState (cekExecuteProgram alwaysError [] x) := by sorry

end Tests.Uplc.AlwaysError
