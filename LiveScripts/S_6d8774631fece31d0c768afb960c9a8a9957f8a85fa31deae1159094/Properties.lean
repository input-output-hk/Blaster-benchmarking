import LiveScripts.Shared
import LiveScripts.S_6d8774631fece31d0c768afb960c9a8a9957f8a85fa31deae1159094.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d8774631fece31d0c768afb960c9a8a9957f8a85fa31deae1159094.script [ctx] 10000]
