import LiveScripts.Shared
import LiveScripts.S_35437e5782e8e7f573c08430cc94eea48586fb4a01540bdd1850e0fd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_35437e5782e8e7f573c08430cc94eea48586fb4a01540bdd1850e0fd.script [ctx] 10000]
