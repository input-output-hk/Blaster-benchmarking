import LiveScripts.Shared
import LiveScripts.S_fceb645fdc06550d62065bc0f95318e8dcd71e6a8c13c05f313b246d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fceb645fdc06550d62065bc0f95318e8dcd71e6a8c13c05f313b246d.script [datum, redeemer, ctx] 10000]
