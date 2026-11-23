import LiveScripts.Shared
import LiveScripts.S_22b8ec4564d3122619d875e8aa43013c019d423544f06200d8eb0a2c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_22b8ec4564d3122619d875e8aa43013c019d423544f06200d8eb0a2c.script [ctx] 10000]
