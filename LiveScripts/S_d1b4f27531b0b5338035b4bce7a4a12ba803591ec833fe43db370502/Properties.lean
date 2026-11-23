import LiveScripts.Shared
import LiveScripts.S_d1b4f27531b0b5338035b4bce7a4a12ba803591ec833fe43db370502.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d1b4f27531b0b5338035b4bce7a4a12ba803591ec833fe43db370502.script [datum, redeemer, ctx] 10000]
