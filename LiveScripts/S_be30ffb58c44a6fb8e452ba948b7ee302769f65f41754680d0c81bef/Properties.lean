import LiveScripts.Shared
import LiveScripts.S_be30ffb58c44a6fb8e452ba948b7ee302769f65f41754680d0c81bef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_be30ffb58c44a6fb8e452ba948b7ee302769f65f41754680d0c81bef.script [datum, redeemer, ctx] 10000]
