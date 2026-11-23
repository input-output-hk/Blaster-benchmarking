import LiveScripts.Shared
import LiveScripts.S_85e3bfa6b315ad81b9a7aa5ac300cf0c41286fa68cc591e619fac0e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_85e3bfa6b315ad81b9a7aa5ac300cf0c41286fa68cc591e619fac0e8.script [ctx] 10000]
