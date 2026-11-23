import LiveScripts.Shared
import LiveScripts.S_4e184586ce5d62d46e0d1ab3305f1d7b811278f1c27eecbf2baacc4d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4e184586ce5d62d46e0d1ab3305f1d7b811278f1c27eecbf2baacc4d.script [datum, redeemer, ctx] 10000]
