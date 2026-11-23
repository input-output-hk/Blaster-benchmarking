import LiveScripts.Shared
import LiveScripts.S_5156adb712df7d278bfd28ae366b8af91803e32e000170d6a08c42b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5156adb712df7d278bfd28ae366b8af91803e32e000170d6a08c42b5.script [datum, redeemer, ctx] 10000]
