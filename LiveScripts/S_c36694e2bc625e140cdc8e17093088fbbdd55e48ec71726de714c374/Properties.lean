import LiveScripts.Shared
import LiveScripts.S_c36694e2bc625e140cdc8e17093088fbbdd55e48ec71726de714c374.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c36694e2bc625e140cdc8e17093088fbbdd55e48ec71726de714c374.script [ctx] 10000]
