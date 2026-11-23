import LiveScripts.Shared
import LiveScripts.S_afae293f6a7de61f8b3faf28e4309ba8072da9d7acd1d293787cef0f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_afae293f6a7de61f8b3faf28e4309ba8072da9d7acd1d293787cef0f.script [datum, redeemer, ctx] 10000]
