import LiveScripts.Shared
import LiveScripts.S_c79b4145d351812445def14c3dddd04e5591e78020a7e976e805952b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c79b4145d351812445def14c3dddd04e5591e78020a7e976e805952b.script [datum, redeemer, ctx] 10000]
