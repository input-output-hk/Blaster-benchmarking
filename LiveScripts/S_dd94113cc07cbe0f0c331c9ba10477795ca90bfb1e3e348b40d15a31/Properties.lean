import LiveScripts.Shared
import LiveScripts.S_dd94113cc07cbe0f0c331c9ba10477795ca90bfb1e3e348b40d15a31.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dd94113cc07cbe0f0c331c9ba10477795ca90bfb1e3e348b40d15a31.script [ctx] 10000]
