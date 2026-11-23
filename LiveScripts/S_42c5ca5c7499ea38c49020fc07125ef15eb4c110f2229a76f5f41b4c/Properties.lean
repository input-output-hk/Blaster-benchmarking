import LiveScripts.Shared
import LiveScripts.S_42c5ca5c7499ea38c49020fc07125ef15eb4c110f2229a76f5f41b4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_42c5ca5c7499ea38c49020fc07125ef15eb4c110f2229a76f5f41b4c.script [ctx] 10000]
