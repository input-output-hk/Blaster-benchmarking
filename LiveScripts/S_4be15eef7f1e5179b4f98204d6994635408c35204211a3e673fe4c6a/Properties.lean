import LiveScripts.Shared
import LiveScripts.S_4be15eef7f1e5179b4f98204d6994635408c35204211a3e673fe4c6a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4be15eef7f1e5179b4f98204d6994635408c35204211a3e673fe4c6a.script [ctx] 10000]
