import LiveScripts.Shared
import LiveScripts.S_d8dca28a22475d2bf4614e3ca59735a7bac3ad1e8310d3ca96c1f59d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8dca28a22475d2bf4614e3ca59735a7bac3ad1e8310d3ca96c1f59d.script [ctx] 10000]
