import LiveScripts.Shared
import LiveScripts.S_278825f2fbb67f3b2418fc239315f8911e4ddf1ddbb14f1f7c9e0393.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_278825f2fbb67f3b2418fc239315f8911e4ddf1ddbb14f1f7c9e0393.script [datum, redeemer, ctx] 10000]
