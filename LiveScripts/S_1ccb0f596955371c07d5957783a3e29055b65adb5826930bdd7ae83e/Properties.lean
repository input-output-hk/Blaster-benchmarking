import LiveScripts.Shared
import LiveScripts.S_1ccb0f596955371c07d5957783a3e29055b65adb5826930bdd7ae83e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1ccb0f596955371c07d5957783a3e29055b65adb5826930bdd7ae83e.script [datum, redeemer, ctx] 10000]
