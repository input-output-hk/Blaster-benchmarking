import LiveScripts.Shared
import LiveScripts.S_5bd5f3841be0ba9db2900612c751898373f457753f6612eb1d06843d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5bd5f3841be0ba9db2900612c751898373f457753f6612eb1d06843d.script [datum, redeemer, ctx] 10000]
