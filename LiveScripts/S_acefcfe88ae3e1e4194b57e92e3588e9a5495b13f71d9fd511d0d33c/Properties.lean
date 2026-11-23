import LiveScripts.Shared
import LiveScripts.S_acefcfe88ae3e1e4194b57e92e3588e9a5495b13f71d9fd511d0d33c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_acefcfe88ae3e1e4194b57e92e3588e9a5495b13f71d9fd511d0d33c.script [datum, redeemer, ctx] 10000]
