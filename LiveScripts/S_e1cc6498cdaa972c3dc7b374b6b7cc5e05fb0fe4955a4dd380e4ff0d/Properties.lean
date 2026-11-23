import LiveScripts.Shared
import LiveScripts.S_e1cc6498cdaa972c3dc7b374b6b7cc5e05fb0fe4955a4dd380e4ff0d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e1cc6498cdaa972c3dc7b374b6b7cc5e05fb0fe4955a4dd380e4ff0d.script [redeemer, ctx] 10000]
