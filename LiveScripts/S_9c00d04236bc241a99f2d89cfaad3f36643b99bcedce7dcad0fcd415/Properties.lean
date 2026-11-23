import LiveScripts.Shared
import LiveScripts.S_9c00d04236bc241a99f2d89cfaad3f36643b99bcedce7dcad0fcd415.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9c00d04236bc241a99f2d89cfaad3f36643b99bcedce7dcad0fcd415.script [ctx] 10000]
