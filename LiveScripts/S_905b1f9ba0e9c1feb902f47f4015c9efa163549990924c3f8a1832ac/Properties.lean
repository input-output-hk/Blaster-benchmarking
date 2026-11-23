import LiveScripts.Shared
import LiveScripts.S_905b1f9ba0e9c1feb902f47f4015c9efa163549990924c3f8a1832ac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_905b1f9ba0e9c1feb902f47f4015c9efa163549990924c3f8a1832ac.script [ctx] 10000]
