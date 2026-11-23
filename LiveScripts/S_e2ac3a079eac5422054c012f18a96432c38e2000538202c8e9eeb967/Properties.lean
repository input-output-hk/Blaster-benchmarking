import LiveScripts.Shared
import LiveScripts.S_e2ac3a079eac5422054c012f18a96432c38e2000538202c8e9eeb967.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e2ac3a079eac5422054c012f18a96432c38e2000538202c8e9eeb967.script [ctx] 10000]
